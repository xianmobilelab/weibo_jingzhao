//
//  userInfoView.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/27/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation
import UIKit

class UserInfoView: UIView {
    
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var describe: UILabel!
    
    private var weibo: UserInfoNumView?
    private var favourite: UserInfoNumView?
    private var follow: UserInfoNumView?
    
    func configureData(viewModel: UserInfoViewViewModel) {
        guard let weibo = weibo, let favourite = favourite, let follow = follow else {
            return
        }
        weibo.configureData(viewModel.weibo)
        favourite.configureData(viewModel.friend)
        follow.configureData(viewModel.follower)
        
        profile.image = viewModel.profileSource
        name.text = viewModel.name
        describe.text = viewModel.describe
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        addInfoNumView()
        setInfoNumLayout()
    }
    
    
    private func addInfoNumView() {
        weibo = infoNumView()
        favourite = infoNumView()
        follow = infoNumView()
    }
    
    func setInfoNumLayout() {
        guard let weibo = weibo, favourite = favourite, follow = follow else {
            return
        }
        addFormatConstraint("H:|[weibo][favour][follow]|", views: ["weibo":weibo, "favour":favourite, "follow":follow])
        addEqualConstraint(weibo, oneAttribute: .Width, two: favourite, twoAttribute: .Width)
        addEqualConstraint(weibo, oneAttribute: .Width, two: follow, twoAttribute: .Width)
        
        addFormatConstraint("V:[weibo]|", views: ["weibo":weibo])
        addFormatConstraint("V:[favour]|", views: ["favour":favourite])
        addFormatConstraint("V:[follow]|", views: ["follow":follow])
        addEqualConstraint(weibo, oneAttribute: .Height, two: favourite, twoAttribute: .Height)
        addEqualConstraint(weibo, oneAttribute: .Height, two: follow, twoAttribute: .Height)
    }
    
    func infoNumView() -> UserInfoNumView? {
        let mainStoryBoard  = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let userInfoContainer = mainStoryBoard.instantiateViewControllerWithIdentifier("UserInfoNumViewContainer")
        guard let userInfoNumView = userInfoContainer.view as? UserInfoNumView else {
            return nil
        }
        userInfoNumView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(userInfoNumView)
        return userInfoNumView
    }
    
    func addFormatConstraint(format:String, views:[String:AnyObject]) {
        addConstraints( NSLayoutConstraint.constraintsWithVisualFormat(format, options: [], metrics: nil, views: views))
        
    }
    
    func addEqualConstraint(one: UIView, oneAttribute:NSLayoutAttribute, two:UIView, twoAttribute:NSLayoutAttribute) {
        addConstraint(NSLayoutConstraint(item: one, attribute: oneAttribute, relatedBy: .Equal , toItem: two, attribute: twoAttribute, multiplier: 1.0, constant: 0))
    }
    
}

class UserInfoNumView: UIView {
    
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var name: UILabel!
    
    func configureData(viewModel: UserInfoNumViewViewModel) {
        name.text = viewModel.name
        count.text = viewModel.count
    }
    
}
