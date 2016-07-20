//
//  StatusCell.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/20/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation
import SwiftyJSON

class StatusCell: UITableViewCell {
    
    let contentLabel = UILabel()
    
    func configureData(statusModel: StatusModel){
    }
    
    func addHeaderView()-> UserHeaderInfoCell? {
        guard let userHeaderViewCell = NSBundle.mainBundle().loadNibNamed("UserHeaderInfoCell", owner: self, options: nil)[0] as? UserHeaderInfoCell else {
           return nil
        }
        //userHeaderView
        userHeaderViewCell.translatesAutoresizingMaskIntoConstraints = false
        addSubview(userHeaderViewCell)
        return userHeaderViewCell
    }
    
    func addFooterView()-> UserFooterInfoCell? {
        guard let userFooterInfoCell = NSBundle.mainBundle().loadNibNamed("UserFooterInfoCell", owner: self, options: nil)[0] as? UserFooterInfoCell else {
            return nil
        }
        //userHeaderView
        userFooterInfoCell.translatesAutoresizingMaskIntoConstraints = false
        addSubview(userFooterInfoCell)
        return userFooterInfoCell
    }
    
    func textContentCell() {
        //UILabel
        contentLabel.lineBreakMode = NSLineBreakMode.ByCharWrapping
        contentLabel.numberOfLines = 0
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentLabel)
    }
    
}