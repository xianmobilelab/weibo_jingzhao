//
//  LogOnModel.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/14/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation

class LogOnModel : NSObject {
    
    let notificationAuthorize = "notificationAuthorize"
    let redirectURI = "https://api.weibo.com/oauth2/default.html"
    typealias CompletionBlock = (response: WBAuthorizeResponse?, logOn: Bool) -> Void
    
    private var authorizeCallBack: CompletionBlock = {_,_ in }
    
    override init() {
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(LogOnModel.authoredDelegate(_:)), name: notificationAuthorize, object: nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func ssoAuthorize( callback: CompletionBlock) {
        guard let requestAuthorize = WBAuthorizeRequest.request() as? WBAuthorizeRequest else {
            return
        }
        requestAuthorize.redirectURI = redirectURI
        requestAuthorize.scope = "all"
        authorizeCallBack = callback
        
        WeiboSDK.sendRequest(requestAuthorize)
    }
    
    func authoredDelegate(notification: NSNotification) {
        guard let responseResult = notification.userInfo? ["responseResult"] as? WBAuthorizeResponse else {
            authorizeCallBack(response: nil, logOn: false)
            return
        }
        if  responseResult.statusCode.rawValue == 0 {
            authorizeCallBack(response: responseResult, logOn: true)
        }
        else {
            authorizeCallBack(response: responseResult, logOn: false)
        }
    }
}

