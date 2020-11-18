//
//  ViewController.swift
//  LXFitManagerModule
//
//  Created by Mac on 2020/4/24.
//  Copyright © 2020 李响. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
               
        print("------\(LXFit.fitInt(12))")
        print("------\(UIFont.systemFont(ofSize: 12).fitFont)")

        
        
//        10.fitInt
//        10.0.fitDouble
//        CGFloat(10).fitFloat
//        UIEdgeInsets().fitEdgeInset
//        CGRect().fitRect
//        CGPoint().fitPoint
        
        let r = CGRect(x: 10, y: 10, width: 20, height: 20)
        
        print("==\(r.fitRect)")
        
    }

}

