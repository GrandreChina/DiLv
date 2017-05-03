//
//  secondTableViewCell.swift
//  DiLv
//
//  Created by Grandre on 17/4/28.
//  Copyright © 2017年 革码者. All rights reserved.
//

import UIKit

class secondTableViewCell: UITableViewCell {

    var viewArr:[secondCellView]! = Array(repeating: secondCellView(), count: 6)
    var titleArr:[String] = ["创意秀绿","友爱托绿","真诚换绿","萌芽增绿","经验享绿","科学培绿"]
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        var index = 0
        for i in 0...1{
            for j in 0...2{
                let xX = CGFloat(j) * ScreenWidth/3
                let yY = CGFloat(i) * 120/2
              
                viewArr[index] = secondCellView(frame: CGRect(x: xX, y: yY, width: ScreenWidth/3, height: 120/2))
                viewArr[index].imageView.image = UIImage(named: "\(index%6).png")
                viewArr[index].titleLabel.text = titleArr[index]
                viewArr[index].tag = index
                self.addSubview(viewArr[index])
                
                index += 1
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func draw(_ rect: CGRect) {
//        let context = UIGraphicsGetCurrentContext()
//        context?.setStrokeColor(Color_NavBackground.cgColor)
//        context?.setLineWidth(0.5)
//        context?.move(to: CGPoint(x: 0, y: self.bounds.height/2))
//        context?.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height/2))
//        context?.strokePath()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
