//
//  HomeViewControllerViewModel.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/20/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Quick
import Nimble
import SwiftyJSON
@testable import weibo_jingzhao

class HomeViewControllerViewModelSpec: QuickSpec {
    override func spec() {
        describe("StatusModel.picUrls get the different Identify") {
            let userTimeLine = UserTimeLine(id: "", screenName: "", name: "", avatarImage: "")
            let timeNoPicUrl = TimeLine(creatAt: "", text: "", source: "", userModel:userTimeLine, picUrls: [])
            let timeHavePicUrl = TimeLine(creatAt: "", text: "", source: "", userModel:userTimeLine, picUrls: [PicUrl(picUrl: "http://***"),PicUrl(picUrl: "http://***")])
            let homeViewModel = HomeViewControllerViewModel(timeLines: [timeNoPicUrl,timeHavePicUrl])
            context("picUrls.count count == 0", {
                let identify = homeViewModel.getCellTypeIdentify(NSIndexPath(forRow: 0, inSection: 0))
                expect(identify).to(equal("identifierStatusTextCell"))
                
            })
            context("picUrls.count count > 0", {
                let identify = homeViewModel.getCellTypeIdentify(NSIndexPath(forRow: 1, inSection: 0))
                expect(identify).to(equal("identifierStatusTextPicCell"))
            })
        }
    }
}
