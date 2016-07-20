//
//  HomeViewControllerViewModel.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/19/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation

class HomeViewControllerViewModel {
    
    private let timeLines: [TimeLine]
    
    init(timeLines: [TimeLine]) {
        self.timeLines = timeLines
    }
    
    var tableViewCount: Int {
        return timeLines.count
    }
    
    var textCellViewModels: [StatusTextCellViewModel] {
        return timeLines.map { StatusTextCellViewModel(model: $0) }
    }
    
}