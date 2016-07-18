//
//  HomeViewController.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/7/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let logOnModel = LogOnModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightBarButton = UIBarButtonItem.init(title: "登陆", style: UIBarButtonItemStyle.Plain, target: self, action:#selector(HomeViewController.logOn))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func logOn() {
        logOnModel.ssoAuthorize { (response, logOn) in
            if (logOn){
                print("登陆成功")
            }
        }
    }
}

