//
//  PicViewCell.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/20/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation
import SwiftyJSON

class PicView: UIView {
    
    private var imageViews = [UIImageView]()
    private var viewModel: PicViewViewModel?
    
    func configurePic(viewModel: PicViewViewModel) {
        self.viewModel = viewModel
        imageViews.removeAll()
        imageViews = viewModel.picImages.map { return getImageView($0) }
        imageViews.forEach {
            self.addSubview($0)
            setLayoutImageView($0)
        }
    }
    
    func clean() {
        imageViews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    func getImageView(image: UIImage)-> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        return imageView
    }
    
    func setLayoutImageView(imageView: UIImageView) {
        let index = imageViews.indexOf(imageView)
        guard let indexImage = index,
            let constraitsVertical = getThrPicVerticalConstaits(indexImage, imageView: imageView) ,
            let constraitsHorizontal = getThrPicHorizontalConstaits(indexImage, imageView: imageView) else {
                return
        }
        addConstraints(constraitsVertical)
        addConstraints(constraitsHorizontal)
    }
    
    func getThrPicHorizontalConstaits(index: Int, imageView: UIImageView) -> [NSLayoutConstraint]? {
        guard let viewModel = viewModel else {
            return nil
        }
        let colIndex = index % viewModel.horizontalNum
        if (colIndex == 0) {
            return colIndex == viewModel.horizontalNum - 1 ?
                getConstraits("H:|[image(==100)]|", views: ["image": imageView]):
                getConstraits("H:|[image(==100)]", views: ["image": imageView])
        } else {
            let imageViewPre = imageViews[index - 1]
            return colIndex == viewModel.horizontalNum - 1 ?
                getConstraits("H:[preImage]-10-[image(==100)]|", views: ["image": imageView, "preImage": imageViewPre]):
                getConstraits("H:[preImage]-10-[image(==100)]", views: ["image": imageView, "preImage":imageViewPre])
        }
    }
    
    func getThrPicVerticalConstaits(index: Int, imageView: UIImageView) -> [NSLayoutConstraint]? {
        guard let viewModel = viewModel else {
            return nil
        }
        let verIndex = index / viewModel.horizontalNum
        if (verIndex == 0) {
            return verIndex == (viewModel.picUrlsCount / viewModel.horizontalNum) - 1 ?
                getConstraits("V:|[image(==200)]|", views: ["image":imageView]) :
                getConstraits("V:|[image(==100)]", views: ["image":imageView])
        } else {
            let imageViewPreVer = imageViews[index-viewModel.horizontalNum]
            return verIndex == (viewModel.picUrlsCount / viewModel.horizontalNum) - 1 ?
                getConstraits("V:[preImage]-10-[image(==100)]|", views: ["image": imageView, "preImage":imageViewPreVer]):
                getConstraits("V:[preImage]-10-[image(==100)]", views: ["image": imageView, "preImage":imageViewPreVer])
        }
    }
    
    func getConstraits(format:String, views:[String:AnyObject]) -> [NSLayoutConstraint]? {
        let constraints =  NSLayoutConstraint.constraintsWithVisualFormat(format, options: [], metrics: nil, views: views)
        return constraints
    }
    
}
