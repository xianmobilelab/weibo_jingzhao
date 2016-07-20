//
//  StatusTextCell.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/19/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation

class StatusTextCell: StatusCell {
    static let identifierCell = "identifierStatusTextCell"
    
    var userHeaderView: UserHeaderInfoCell?
    var textContent = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addViews()
    }
    
    override func configureData(statusModel: StatusModel) {
        textContent.text = statusModel.text
        userHeaderView?.configureData(statusModel.userModel)
    }
    
    func addViews() {
        guard let userHeaderViewCell = NSBundle.mainBundle().loadNibNamed("UserHeaderInfoCell", owner: self, options: nil)[0] as? UserHeaderInfoCell else {
            return
        }
        
        //userHeaderView
        userHeaderViewCell.translatesAutoresizingMaskIntoConstraints = false
        addSubview(userHeaderViewCell)
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[userHeader]|", options: [], metrics: nil, views: ["userHeader":userHeaderViewCell]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[userHeader(60)]", options: [], metrics: nil, views: ["userHeader":userHeaderViewCell]))
        userHeaderView = userHeaderViewCell
        
        //UILabel
        textContent.lineBreakMode = NSLineBreakMode.ByCharWrapping
        textContent.numberOfLines = 0
        textContent.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textContent)
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[text]-10-|", options: [], metrics: nil, views: ["userHeader":userHeaderViewCell,"text":textContent]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[userHeader][text]|", options: [], metrics: nil, views: ["userHeader":userHeaderViewCell,"text":textContent]))
    }
    
}