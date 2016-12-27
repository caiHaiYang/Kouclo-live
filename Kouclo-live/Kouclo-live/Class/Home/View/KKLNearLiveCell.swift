//
//  KKLNearLiveCell.swift
//  Kouclo-live
//
//  Created by liwei on 2016/12/26.
//  Copyright © 2016年 live. All rights reserved.
//  附近的人cell

import UIKit

class KKLNearLiveCell: UICollectionViewCell {

    @IBOutlet weak var headerView: UIImageView!
    @IBOutlet weak var detailLable: UILabel!

    var live:KKLLive?{
        didSet{
            
            let imageUrl = IMAGE_HOST + (live?.creator?.portrait)!
            self.headerView.downloadImage(url: imageUrl, placeholderImageName: KKLPlaceholderImageName)
            
            self.detailLable.text = live?.distance
        }
    }
    
    ///加载动画
    func showAnimation(){
        if (self.live?.isShow)! {
            return
        }
        
        self.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        UIView.animate(withDuration: 0.5) { 
            self.layer.transform = CATransform3DMakeScale(1, 1, 1)
            self.live?.isShow = true
        }
    }
    
}