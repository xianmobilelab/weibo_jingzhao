//
//  StatusTextCell.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/19/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation

class StatusTextCell: UITableViewCell {
    
    static let identifierCell = "identifierStatusTextCell"
    
    private var userHeaderView: UserHeaderView?
    private let textContent = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addViews()
        addSubViewLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        textContent.text = ""
        userHeaderView?.clean()
    }
    
    func configureData(viewModel: StatusTextCellViewModel) {
        textContent.text = viewModel.textContent
        if  let userHeaderView = userHeaderView {
          userHeaderView.configureData(viewModel.userHeaderViewModel)
        }
    }
    
    //MARK: private
    func addViews() {
        addLabelView()
        addHeaderView()
    }
    
    func addLabelView() {
        textContent.lineBreakMode = .ByCharWrapping
        textContent.numberOfLines = 0
        textContent.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textContent)
    }
    
    func addHeaderView() {
        let mainStoryBoard  = UIStoryboard(name: "Main", bundle: NSBundle .mainBundle())
        let userHeaderViewContainer = mainStoryBoard.instantiateViewControllerWithIdentifier("UserHeaderViewContainer")
        if let userInHeaderView = userHeaderViewContainer.view as? UserHeaderView {
            userInHeaderView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(userInHeaderView)
            userHeaderView = userInHeaderView
        }
    }
    
    func addSubViewLayout() {
        guard let userHeaderView = userHeaderView else {
            return
        }
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[userHeader]|", options: [], metrics: nil, views: ["userHeader":userHeaderView]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[userHeader(60)]", options: [], metrics: nil, views: ["userHeader":userHeaderView]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[text]-10-|", options: [], metrics: nil, views: ["userHeader":userHeaderView,"text":textContent]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[userHeader][text]|", options: [], metrics: nil, views: ["userHeader":userHeaderView,"text":textContent]))
    }
    
}
