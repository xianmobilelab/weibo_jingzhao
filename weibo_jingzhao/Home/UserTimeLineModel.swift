//
//  UserTimeLineMode.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/18/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserTimeLineModel: NSObject, WBHttpRequestDelegate {
    
    var timeLineCallBack:TimeLineCallBack = {_ in}
    typealias TimeLineCallBack = (data:NSDictionary) -> Void
    
    func requestTimeLineData(accessToken:String, pageNum:String, countNum:String, callBack:TimeLineCallBack)  {
        timeLineCallBack = callBack
        let _ = WBHttpRequest.init(URL: "https://api.weibo.com/2/statuses/user_timeline.json",
                                   httpMethod: "GET",
                                   params: ["access_token":accessToken,"page":pageNum,"count":countNum],
                                   delegate: self, withTag: "user_timeline")
    }
    
    func request(request: WBHttpRequest!, didFinishLoadingWithResult result: String!) {
        if let dataFromString = result.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
            let json = JSON(data: dataFromString)
            let _ = json["statuses"].arrayValue
        }
    }
    
    func request(request: WBHttpRequest!, didFailWithError error: NSError!) {
        print("error")
    }
}
