//
//  HomeViewController.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/7/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let logonUser = Logon()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightBarButton = UIBarButtonItem(title: "登陆", style: UIBarButtonItemStyle.Plain, target: self, action:#selector(HomeViewController.logon))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func logon() {
        logonUser.ssoAuthorize { (response, logon) in
            if (logon){
                print("登陆成功")
            }
        }
    }
}

