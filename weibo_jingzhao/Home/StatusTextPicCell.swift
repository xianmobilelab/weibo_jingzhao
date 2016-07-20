//
//  StatusTextPicCell.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/19/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation

class StatusTextPicCell: StatusCell {
    static let identifierCell = "identifierStatusTextPicCell"
    var headerView:UserHeaderInfoCell?
    var footerView:UserFooterInfoCell?
    var picView = PicViewCell()
    
    override func configureData(statusModel: StatusModel) {
        guard let headerView = headerView else {
            return
        }
        headerView.configureData(statusModel.userModel)
        contentLabel.text = statusModel.text
        picView.configurePic(statusModel.picUrls)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviewNeed()
        setUpLayout()
    }
    
    func addSubviewNeed() {
        headerView =  addHeaderView()
        footerView = addFooterView()
        textContentCell()
        addPicView()
    }
    
    func addPicView() {
        picView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(picView)
    }
    
    func setUpLayout() {
        guard let headerView = headerView, let footerView = footerView else {
            return
        }
        addConstraits("H:|[header]|", views:["header":headerView])
        addConstraits("V:|[header(==60)]", views: ["header":headerView])
        addConstraits("H:|[text]|", views: ["text":contentLabel])
        addConstraits("V:[header][text]", views: ["header":headerView,"text":contentLabel])
        addConstraits("H:|[picView]", views: ["picView":picView])
        addConstraits("V:[text][picView]", views: ["text":contentLabel, "picView":picView])
        addConstraits("H:|[footer]|", views: ["footer":footerView])
        addConstraits("V:[picView][footer]|", views: ["picView":picView, "footer":footerView])
    }
    
}