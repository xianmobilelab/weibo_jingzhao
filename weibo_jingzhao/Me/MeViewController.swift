//
//  HomeViewController.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/7/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import UIKit

class MeViewController: UIViewController {
    
    private var viewModel: MeViewControllerViewModel?
    private let userInfo = UserInfoRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestUserInfo()
    }
    
    func requestUserInfo() {
        userInfo.requesetUserInfo { [weak self] (weiboUser) in
            guard let weiboUser = weiboUser,
                let controller = self else {
                    return
            }
            let model = UserInfoTransform().transformUserInfo(weiboUser)
            controller.viewModel = MeViewControllerViewModel(userInfo: model)
        }
    }
    
}
