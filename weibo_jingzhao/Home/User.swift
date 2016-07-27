//
//  User.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/22/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation

class UserTransform {
    
    func userTransformFromResponse(response: WBAuthorizeResponse) -> User {
        return  User(userID: response.userID, accessToken: response.accessToken, expirationDate: response.expirationDate, refreshToke: response.refreshToken)
    }
    
    func userTransformFromDictionary(inputDict: Dictionary<String, AnyObject>) -> User? {
        guard let userId = inputDict["userID"] as? String,
            let accessToken = inputDict["accessToken"] as? String,
            let expirationDate = inputDict["expirationDate"] as? NSDate,
            let refreshToke = inputDict["refreshToke"] as? String else{
                return nil
        }
        return User(userID: userId, accessToken: accessToken, expirationDate: expirationDate, refreshToke: refreshToke)
    }
    
    func userDictionaryFromUser(user: User) -> Dictionary<String, AnyObject> {
        return ["userID": user.userID,"accessToken": user.accessToken,"expirationDate": user.expirationDate,"refreshToke": user.refreshToke]
    }
    
}

class UserStore {
    
    let userTransform = UserTransform()
    
    func storeUser(user: User) {
        let userDic = userTransform.userDictionaryFromUser(user)
        NSUserDefaults.standardUserDefaults().setValue(userDic, forKey: "userInformation")
    }
    
    func fetchUser() -> User? {
        guard let userDic = NSUserDefaults.standardUserDefaults().objectForKey("userInformation") as? Dictionary<String, AnyObject>  else {
            return nil
        }
        return userTransform.userTransformFromDictionary(userDic)
    }
    
}

struct User {
    
    let userID: String
    let accessToken: String
    let expirationDate: NSDate
    let refreshToke: String
    
}
