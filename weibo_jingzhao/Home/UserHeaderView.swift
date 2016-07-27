//
//  UserHeaderInfoCell.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/19/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation

class UserHeaderView: UIView {
    
    @IBOutlet var title: UILabel!
    @IBOutlet var information: UILabel!
    @IBOutlet var comment: UILabel!
    @IBOutlet var profile: UIImageView!
    
    func configureData(viewModel: UserHeaderViewModel) {
        profile.image = viewModel.profileImage
        title.text = viewModel.name
    }
    
    func clean() {
        profile.image = nil
        title.text  = ""
    }
    
}
