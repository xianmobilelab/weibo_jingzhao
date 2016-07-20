//
//  StatusTextPicCell.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/19/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation

class StatusTextPicCell: UITableViewCell {
    
    static let identifierCell = "identifierStatusTextPicCell"
    
    private var headerView: UserHeaderView?
    private var footerView: UserFooterView?
    private let contentLabel = UILabel()
    private let picView = PicView()
    
    func configureData(viewModel: StatusTextPicCellViewModel) {
        if let headerView = headerView {
            headerView.configureData(viewModel.userHeaderViewModel)
            contentLabel.text = viewModel.text
            picView.configurePic(viewModel.picViewViewModel)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubsView()
        setUpLayout()
    }
    
    //MARK:private
    func addSubsView() {
        addHeaderView()
        addFooterView()
        addPicView()
        addLableContent()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentLabel.text = ""
        headerView?.clean()
        picView.clean()
    }
    
    func addHeaderView() {
        let mainStoryBoard  = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let userHeaderViewContainer = mainStoryBoard.instantiateViewControllerWithIdentifier("UserHeaderViewContainer")
        if let userInHeaderView = userHeaderViewContainer.view as? UserHeaderView {
            userInHeaderView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(userInHeaderView)
            headerView = userInHeaderView
        }
    }
    
    func addFooterView() {
        let mainStoryBoard  = UIStoryboard(name: "Main", bundle: NSBundle .mainBundle())
        let userFooterViewContainer = mainStoryBoard.instantiateViewControllerWithIdentifier("UserFooterViewContainer")
        if let userFooterView = userFooterViewContainer.view as? UserFooterView {
            userFooterView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(userFooterView)
            footerView = userFooterView
        }
    }
    
    func addLableContent() {
        contentLabel.lineBreakMode = .ByCharWrapping
        contentLabel.numberOfLines = 0
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentLabel)
    }
    
    func addPicView() {
        picView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(picView)
    }
    
    func setUpLayout() {
        if let headerView = headerView, let footerView = footerView {
            addConstraits("H:|-10-[header]|", views: ["header": headerView])
            addConstraits("V:|-10-[header(==60)]", views: ["header": headerView])
            addConstraits("H:|[text]|", views: ["text": contentLabel])
            addConstraits("V:[header][text]", views: ["header": headerView, "text": contentLabel])
            addConstraits("H:|[picView]", views: ["picView": picView])
            addConstraits("V:[text][picView]", views: ["text": contentLabel, "picView": picView])
            addConstraits("H:|[footer]|", views: ["footer": footerView])
            addConstraits("V:[picView][footer(==50)]|", views: ["picView": picView, "footer": footerView])
        }
    }
    
}
