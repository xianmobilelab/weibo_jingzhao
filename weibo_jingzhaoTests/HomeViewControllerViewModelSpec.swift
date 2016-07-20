//
//  HomeViewControllerViewModel.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/20/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Quick
import Nimble

class HomeViewControllerViewModelSpec: QuickSpec {
    override func spec() {
        describe("StatusModel.picUrls get the different Identify") {
            context("picUrls.count count == 0", {
                let statusModelMock = StatusModel(jsonData: nil)
                statusModelMock.picUrls = []
                let identify = HomeViewControllerViewModel.getCellTypeIdentify(statusModelMock)
                expect(identify).to(equal("identifierStatusTextCell"))
                
            })
            context("picUrls.count count > 0", {
                let statusModelMock = StatusModel(jsonData: nil)
                statusModelMock.picUrls = ["http://***"]
                let identify = HomeViewControllerViewModel.getCellTypeIdentify(statusModelMock)
                expect(identify).to(equal("identifierStatusTextPicCell"))
                
            })
        }
    }
}
