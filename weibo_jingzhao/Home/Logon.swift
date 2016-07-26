//
//  LogonModel.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/14/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation

class Logon: NSObject {
    
    let notificationAuthorize = "notificationAuthorize"
    let redirectURI = "https://api.weibo.com/oauth2/default.html"
    typealias CompletionBlock = (response: WBAuthorizeResponse?, logon: Bool) -> Void
    
    private var authorizeCallBack: CompletionBlock = { _,_ in }
    
    override init() {
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(Logon.authoredDelegate( _:)), name: notificationAuthorize, object: nil)
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
            authorizeCallBack(response: nil, logon: false)
            return
        }
        if  responseResult.statusCode.rawValue == 0 {
            authorizeCallBack(response: responseResult, logon: true)
        }
        else {
            authorizeCallBack(response: responseResult, logon: false)
        }
    }
    
}
