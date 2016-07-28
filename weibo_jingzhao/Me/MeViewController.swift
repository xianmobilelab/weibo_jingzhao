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
    private var infoView: UserInfoView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestUserInfo()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "userInfo" {
            let view = segue.destinationViewController.view as? UserInfoView
            infoView = view
        }
    }
    
    func requestUserInfo() {
        userInfo.requesetUserInfo { [weak self] (weiboUser) in
            guard let weiboUser = weiboUser,
                let controller = self else {
                    return
            }
            let model = UserInfoTransform().transformUserInfo(weiboUser)
            controller.viewModel = MeViewControllerViewModel(userInfo: model)
            if let infoView = controller.infoView, let viewModel = controller.viewModel {
                infoView.configureData(viewModel.infoViewModel)  
            }
        }
    }
    
}
