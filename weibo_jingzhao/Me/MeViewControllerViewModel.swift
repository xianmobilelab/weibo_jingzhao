//
//  MeViewControllerViewModel.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/27/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation

class MeViewControllerViewModel {
    
    private let userInfo: UserInfoModel

    init(userInfo: UserInfoModel) {
        self.userInfo = userInfo
    }
    
    var infoViewModel: UserInfoViewViewModel {
        return UserInfoViewViewModel(userInfo: userInfo)
    }

}
