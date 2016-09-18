//
//  NinJaContainerView.swift
//  ProperAnimation10Study
//
//  Created by lotawei on 16/9/18.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit

class NinJaContainerView: UIView {
    let   aimageview  = UIImageView(image: UIImage(named: "ninjia"))
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(aimageview)
    }
    var   orcenter:CGPoint?
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        aimageview.frame = CGRect(x: 0, y: 0, width: 50, height: 70)
        aimageview.center = {
        let   x = (frame.minX  +  aimageview.frame.width/2 - 2)
        let   y = (frame.maxY  -  aimageview.frame.height/2 - 2)
        
            return  CGPoint(x:x,y:y)
        }()
        orcenter = aimageview.center
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor
        layer.borderWidth = 2.0
        
        
    }
    
    func movetobottomright()  {
        aimageview.center =  {
            let  x = frame.maxX -  aimageview.frame.width/2 - 2
            let  y = frame.maxY -  aimageview.frame.height/2 - 2
            return   CGPoint(x:x,y:y)
        }()
        
    }
    func resetpos()  {
            aimageview.center = orcenter!
    }
    
}
