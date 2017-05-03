//
//  topScrollViewCell.swift
//  DiLv
//
//  Created by Grandre on 17/4/28.
//  Copyright © 2017年 革码者. All rights reserved.
//

import UIKit
import SDCycleScrollView
class topScrollViewCell: UITableViewCell,SDCycleScrollViewDelegate {


    var cycleScrollView:SDCycleScrollView!
    var titleArr:[Any]!  = ["春","夏","秋","冬","暖"]
    var imageArr:[Any]!  = []

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        cycleScrollView = SDCycleScrollView(frame: CGRect(x:0,y:0,width:ScreenWidth,height:200), delegate: self, placeholderImage: UIImage(named: "place_image.png"))
//        cycleScrollView.imageURLStringsGroup = imageArr
        cycleScrollView.bannerImageViewContentMode = .scaleAspectFill

        cycleScrollView.titlesGroup = titleArr
        cycleScrollView.autoScrollTimeInterval = 2
        cycleScrollView.pageControlStyle  = .init(0)
        
        cycleScrollView.delegate = self
        self.addSubview(cycleScrollView)
     
    }
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
//        print(index)
        let pushVC = TwoViewController()
        if let vc = cycleScrollView.findNavigator(){
            vc.pushViewController(pushVC, animated: true)
        }
    }
    func initImagesNameArray() -> Array<AnyObject>{
        
        var imagesNameArray: Array<AnyObject> = []
        //添加网络图片
        imagesNameArray.append("http://pic72.nipic.com/file/20150716/21422793_144600530000_2.jpg" as AnyObject)
        imagesNameArray.append("http://img2.3lian.com/img2007/4/22/303952037bk.jpg" as AnyObject)
        imagesNameArray.append("http://img.61gequ.com/allimg/2011-4/201142614314278502.jpg" as AnyObject)
        imagesNameArray.append("http://img15.3lian.com/2015/f1/5/d/108.jpg" as AnyObject)
        imagesNameArray.append("http://img3.3lian.com/2013/v10/79/d/86.jpg" as AnyObject)
        
        return imagesNameArray
    }

    
      required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit{
        print("释放")
    }
}
