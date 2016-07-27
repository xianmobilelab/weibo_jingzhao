//
//  StatusTextCellViewModel.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/23/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation

class StatusTextCellViewModel {

    private let model: TimeLine
    
    init (model: TimeLine) {
        self.model = model
    }
    
    var textContent: String {
        return model.text
    }
    
    var userHeaderViewModel: UserHeaderViewModel {
        return UserHeaderViewModel(model: model.userModel)
    }
    
}
