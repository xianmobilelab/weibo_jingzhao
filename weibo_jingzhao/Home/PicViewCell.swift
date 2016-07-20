//
//  PicViewCell.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/20/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation
import SwiftyJSON

class PicViewCell: UIView {
    
    var arrayImageView = [UIImageView]()
    
    func configurePic(picUrls: [JSON]) {
        let picUrlsData = JSON(picUrls).arrayValue
        
        // one picture
        if picUrls.count == 1 {
            guard let imageView = addOneImage(picUrls[0]["thumbnail_pic"].stringValue) else {
                return
            }
            addConstraits("H:|[image(==150)]|", views: ["image":imageView])
            addConstraits("V:|[image(==200)]|", views: ["image":imageView])
        }else {
            for (index, subjson) in picUrlsData.enumerate() {
                let strPicUrl = subjson["thumbnail_pic"].stringValue
                guard let imageView = addOneImage(strPicUrl) else {
                    return
                }
                arrayImageView.append(imageView)
                let colNum:NSInteger
                if picUrlsData.count == 4 {
                    colNum = 2
                }else {
                    colNum = 3
                }
                
                let row = index/colNum
                let col = index%colNum
                
                //行
                switch col {
                case 0:
                    addConstraits("H:|[image(==100)]", views: ["image":imageView])
                    break
                case 1:
                    let imageViewPre = arrayImageView[index-1]
                    if picUrlsData.count == 2 {
                        addConstraits("H:[preImage]-10-[image(==100)]|", views: ["image":imageView,"preImage":imageViewPre])
                    }else{
                        addConstraits("H:[preImage]-10-[image(==100)]", views: ["image":imageView,"preImage":imageViewPre])
                    }
                    break
                default:
                    let imageViewPre = arrayImageView[index-1]
                    addConstraits("H:[preImage]-10-[image(==100)]|", views: ["image":imageView,"preImage":imageViewPre])
                    break
                }
                
                //列
                switch row {
                case 0:
                    //第一行 不是最后一行
                    if index != picUrlsData.count - 1 {
                        addConstraits("V:|[image(==100)]", views: ["image":imageView])
                    }else {
                        addConstraits("V:|[image(==100)]|", views: ["image":imageView])
                    }
                    break
                default:
                    //是否是最后一行的其他行
                    let imageViewPre = arrayImageView[index-colNum]
                    if index != picUrlsData.count-1 {
                        addConstraits("V:[preImage]-10-[image(==100)]", views: ["image":imageView,"preImage":imageViewPre])
                    }else {
                        addConstraits("V:[preImage]-10-[image(==100)]|", views: ["image":imageView,"preImage":imageViewPre])
                    }
                    break
                }
            }
        }
    }
    
    func addOneImage(url: String) -> UIImageView? {
        guard let url = NSURL.init(string: url), let imageData = NSData.init(contentsOfURL: url) else {
            return nil
        }
        let imageView = UIImageView()
        imageView.image = UIImage(data: imageData)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        return imageView
    }
    
}