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

    }


}

