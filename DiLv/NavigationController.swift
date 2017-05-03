//
//  NavigationController.swift
//  Liwushuo
//
//  Created by hans on 16/6/28.
//  Copyright © 2016年 汉斯哈哈哈. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = Color_NavBackground
        self.interactivePopGestureRecognizer!.delegate = nil;

        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),NSFontAttributeName:UIFont(name: "SentyTEApro", size: 24.0)!]
   
        

    }

    lazy var backBtn:UIBarButtonItem = UIBarButtonItem(title: "<返回", style: .plain, target: self, action: #selector(self.backBtnAction))
    

    func backBtnAction() {
        self.popViewController(animated: true)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.childViewControllers.count > 0 {
            viewController.navigationItem.leftBarButtonItem = backBtn
          
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
}
