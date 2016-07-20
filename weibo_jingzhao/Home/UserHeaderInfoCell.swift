//
//  UserHeaderInfoCell.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/19/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation

class UserHeaderInfoCell: UIView {
    
    @IBOutlet var title: UILabel!
    @IBOutlet var information: UILabel!
    @IBOutlet var comment: UILabel!
    @IBOutlet var profile: UIImageView!
    
    func configureData(userInfo: UserModel){
        guard let urlAvatarImage = NSURL.init(string: userInfo.avatarImage),
            let dataAvatar = NSData.init(contentsOfURL: urlAvatarImage) else{
                return
        }
        profile.image = UIImage.init(data:dataAvatar)
        title.text = userInfo.name
    }
}