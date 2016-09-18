//
//  ViewController.swift
//  ProperAnimation10Study
//
//  Created by lotawei on 16/9/18.
//  Copyright © 2016年 lotawei. All rights reserved.
//
//这种  由多个堆其的动画 相互同时间可以 影响 打断
import UIKit

class ViewController: UIViewController {
    let   aconterview = NinJaContainerView(frame: CGRect(x: 1, y: 1, width: UIScreen.main.bounds.size.width - 2  , height:  UIScreen.main.bounds.size.width - 2))
    var   abtn = UIButton()
      var  bbtn = UIButton()
    var   cbtn = UIButton()
    //创建一个amimator  管理动画
    let  animator = UIViewPropertyAnimator(duration: 2.0, curve: .easeInOut)
    //自定义曲线动画  先慢 然后很快
    let beizerParas  = UICubicTimingParameters(controlPoint1: CGPoint(x:0.05,y:0), controlPoint2: CGPoint(x:0.95,y:0))
    var  beizeranimator:UIViewPropertyAnimator?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(aconterview)
        abtn.setTitle("移动吧", for: .normal)
        abtn.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        abtn.addTarget(self, action: #selector(moveaction), for: .touchUpInside)
        view.addSubview(abtn)
        bbtn.setTitle("回滚动画", for: .normal)
        bbtn.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        bbtn.addTarget(self, action: #selector(breakanimator), for: .touchUpInside)
        view.addSubview(bbtn)
        cbtn.setTitle("曲线救国", for: .normal)
        cbtn.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        cbtn.addTarget(self, action: #selector(movepathaction), for: .touchUpInside)
        view.addSubview(cbtn)
        
        beizeranimator = UIViewPropertyAnimator(duration: 4.0, timingParameters: beizerParas)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    // 打断当前的动画
    func   breakanimator()
    {
        animator.isReversed = true
        beizeranimator?.isReversed = true
    }
    
    func  moveaction () {
        //1.原始方式的最基本使用
//         UIViewPropertyAnimator(duration: 2.0, curve: .easeOut) {
//            weak  var   tmpself = self
//            
//            
//           tmpself!.aconterview.movetobottomright()
//            
//        }.startAnimation()
        //2. 合成动画
        
        animator.isReversed = false
        
        
        animator.addAnimations {
            weak  var   tmpself = self
            tmpself!.aconterview.movetobottomright()
        }
        animator.addAnimations {
            weak  var   tmpself = self
            tmpself!.aconterview.alpha = 0.0
        }
        animator.addCompletion { (_) in
            weak  var   tmpself = self
            tmpself!.aconterview.resetpos()
        }
       
        animator.startAnimation()
         
            
       
    }
    func  movepathaction () {
        beizeranimator?.isReversed = false
        beizeranimator?.addAnimations {
            weak  var   tmpself = self
            tmpself!.aconterview.movetobottomright()
            
        }
        beizeranimator?.addCompletion({ (pos) in
            print(pos.rawValue)
        })
        beizeranimator?.startAnimation()
    }

    override func viewWillLayoutSubviews() {
        
        
        abtn.frame.size = CGSize(width: 100, height: 30)
        abtn.frame.origin = {
            let   x  = self.view.center.x - 50
            let   y  =  aconterview.frame.maxY + 10 + 50
            return   CGPoint(x:x,y:y)
        }()
        bbtn.frame.size = CGSize(width: 100, height: 30)
        bbtn.frame.origin = {
            let   x  = self.view.center.x - 50
            let   y  =  abtn.frame.maxY + 10 + 50
            return   CGPoint(x:x,y:y)
        }()
        cbtn.frame.size = CGSize(width: 100, height: 30)
        cbtn.frame.origin = {
            let   x  = self.view.center.x - 50
            let   y  =  bbtn.frame.maxY + 10 + 50
            return   CGPoint(x:x,y:y)
        }()
        
    }
    


}

