//
//  HomeViewControllerViewModel.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/19/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation

class HomeViewControllerViewModel {
    
    static func getCellTypeIdentify(statusModel:StatusModel) -> String {
        if statusModel.picUrls.count > 0 {
            return "identifierStatusTextPicCell"
        }else{
            return "identifierStatusTextCell"            
        }
    }
}