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
    
    var authorResponseResult:WBAuthorizeResponse?
    private var authorizeCallBack: CompletionBlock = {_,_ in }
    
    override init() {
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(LogOnModel.authoredDelegate(_:)), name: notificationAuthorize, object: nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    /*
     public function
     */
    
    static func storeUserInformation(response:WBAuthorizeResponse)  {
        NSUserDefaults.standardUserDefaults().setObject(response.userInfo, forKey: "userInformation")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    static func getStoreUserInformation() -> NSDictionary? {
        guard let userInfo = NSUserDefaults.standardUserDefaults().objectForKey("userInformation") as? NSDictionary else{
            return nil
        }
        return userInfo
    }
    
    static func boolLogOn() -> Bool {
        guard let _ = NSUserDefaults.standardUserDefaults().objectForKey("userInformation") as? NSDictionary else {
            return false
        }
        return true
    }
    
    /*
     private function
     */
    
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
            authorResponseResult = responseResult
            authorizeCallBack(response: responseResult, logOn: true)
        }
        else {
            authorizeCallBack(response: responseResult, logOn: false)
        }
    }
}

