//
//  secondCellView.swift
//  DiLv
//
//  Created by Grandre on 17/4/28.
//  Copyright © 2017年 革码者. All rights reserved.
//

import UIKit


extension UIView {
    
    
    func findController() -> UIViewController! {
        return self.findControllerWithClass(UIViewController.self)
    }
    
    func findNavigator() -> UINavigationController! {
        return self.findControllerWithClass(UINavigationController.self)
    }
    
    func findControllerWithClass<T>(_ clzz: AnyClass) -> T? {
        var responder = self.next
        while(responder != nil) {
            if (responder!.isKind(of: clzz)) {
                return responder as? T
            }
            responder = responder?.next
        }
        
        return nil
    }
    
    
}
class secondCellView: UIView {
    var imageView:UIImageView!
    var titleLabel:UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView(frame: CGRect(x: 10, y: 5, width: self.bounds.width - 20, height: 35))
        imageView.layer.cornerRadius = 5
        imageView.backgroundColor = UIColor.blue
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        self.addSubview(imageView)
        
        titleLabel = UILabel(frame: CGRect(x: 10, y: 45, width: self.bounds.width - 20, height: 15))
        titleLabel.textAlignment = .center
        titleLabel.text = "递绿"
        titleLabel.textColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        titleLabel.font = UIFont(name: "Bauhaus ITC", size: 15.0)
        self.addSubview(titleLabel)
        
        self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGestureReg))
        self.addGestureRecognizer(tapGesture)
        
    }
    
    func tapGestureReg(){
        print("----\(self.tag)----")
        
        let vc = TwoViewController()
        if let curVC = self.findNavigator(){
            curVC.pushViewController(vc, animated: true)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
