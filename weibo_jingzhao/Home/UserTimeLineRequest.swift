//
//  UserTimeLine.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/18/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserTimeLineRequest: NSObject, WBHttpRequestDelegate {
    
    var timeLineCallBack: TimeLineCallBack = { _ in}
    typealias TimeLineCallBack = (result: String) -> Void
    
    func requestTimeLineData(pageNum: String, countNum: String, callBack: TimeLineCallBack)  {
        guard let user = UserStore().fetchUser() else {
            return
        }
        timeLineCallBack = callBack
        let _ = WBHttpRequest(URL: "https://api.weibo.com/2/statuses/user_timeline.json",
                              httpMethod: "GET",
                              params: ["access_token": user.accessToken, "page": pageNum, "count": countNum],
                              delegate: self, withTag: "user_timeline")
    }
    
    func request(request: WBHttpRequest?, didFinishLoadingWithResult result: String?) {
        guard let result = result else {
            return
        }
        timeLineCallBack(result: result)
    }
    
    func request(request: WBHttpRequest?, didFailWithError error: NSError?) {
        print(error)
    }
    
}
