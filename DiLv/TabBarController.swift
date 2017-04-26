//
//  TabBarController.swift
//  Liwushuo
//
//  Created by hans on 16/6/28.
//  Copyright © 2016年 汉斯哈哈哈. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewControllers()
        self.tabBar.tintColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        self.tabBar.barTintColor = UIColor.white
        
    }
    
    private func addChildViewControllers(){
        addChildViewController(controller: OneViewController(), title: "首页", imageName: "icon_tabbar_subscription")
        addChildViewController(controller: TwoViewController(), title: "养护知识", imageName: "icon_tabbar_home")
        addChildViewController(controller: ThreeViewController(), title: "递绿", imageName: "icon_tabbar_send")
        addChildViewController(controller: FourViewController(), title: "消息", imageName: "icon_tabbar_notification")
        addChildViewController(controller: FiveViewController(), title: "我", imageName: "icon_tabbar_me")
        
    }
    
    private func addChildViewController(controller: UIViewController, title:String, imageName:String){
        
        controller.tabBarItem.image = UIImage(named: imageName)
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_active")
        controller.tabBarItem.title = title
        controller.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "SentyTEApro", size: 13)!], for: .normal)
        controller.title = title
    
        
        let nav = NavigationController()
        nav.addChildViewController(controller)
        addChildViewController(nav)
        
    }
}
