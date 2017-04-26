//
//  OneViewController.swift
//  DiLv
//
//  Created by Grandre on 17/4/25.
//  Copyright © 2017年 革码者. All rights reserved.
//

import UIKit

class OneViewController: UIViewController,UITableViewDataSource
,UITableViewDelegate{

    var bottomTableView:UITableView!
    var searchTextField:UITextField!
    var navSearchView:UIView!
    var ColorFalg:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.barStyle = .blackTranslucent
        self.setNeedsStatusBarAppearanceUpdate()
        
    
        self.initButtomTable()
        self.initNavSearchView()
        



        
    }

    func initNavSearchView(){
        
        self.navSearchView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 65))
        self.navSearchView.backgroundColor = Color_NavBackground
        self.navSearchView.backgroundColor = UIColor.clear
//        self.navSearchView.alpha = 0

        self.view.addSubview(navSearchView)
        
        
        self.searchTextField = UITextField(frame: CGRect(x: ScreenWidth*0.8, y: 25, width: ScreenWidth*0.2-15, height: 30))
        self.searchTextField.borderStyle = .roundedRect
        self.searchTextField.backgroundColor = UIColor.white
        self.searchTextField.placeholder = "搜索你想要的"
        self.searchTextField.font = UIFont(name: "SentyTEApro", size: 13)
        
        self.navSearchView.addObserver(self, forKeyPath: "backgroundColor", options: NSKeyValueObservingOptions.new, context: nil)

        self.navSearchView.addSubview(self.searchTextField)
        
    }

    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (keyPath == "backgroundColor" ){
            
        let alpha = change?[NSKeyValueChangeKey.newKey] as! UIColor
                print("color chaneg")
            if alpha == Color_NavBackground{
 
                print("------haha tong")
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 15, initialSpringVelocity: 10, options: UIViewAnimationOptions.curveEaseIn, animations: {
                    self.searchTextField.frame = CGRect(x: 10, y: 30, width: ScreenWidth - 20, height: 30)
                }, completion: { (finish) in
                    
                })
            
            }
            if alpha == UIColor.clear{
                
                print("------haha tong")
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 15, initialSpringVelocity: 5, options: UIViewAnimationOptions.curveEaseIn, animations: {
                    self.searchTextField.frame = CGRect(x: ScreenWidth*0.8, y: 25, width: ScreenWidth*0.2-15, height: 30)
                    
                
                }, completion: { (finish) in
                    
                })
                
             
            }
            
            

            
        }
        
    }
    func initButtomTable(){
        self.bottomTableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: self.view.bounds.height - (self.tabBarController?.tabBar.frame.height)!))
        self.bottomTableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.bottomTableView.delegate = self
        self.bottomTableView.dataSource = self
        self.view.addSubview(self.bottomTableView)
     
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Grandre\(indexPath)"
        
        return cell
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentofset = scrollView.contentOffset
//        print("--\(contentofset)---")
        
        let Yoffset = contentofset.y
        if (0 <= Yoffset && Yoffset <= 120){
//            self.navSearchView.isHidden = false
            self.navSearchView.backgroundColor = Color_NavBackground.withAlphaComponent(Yoffset/121)
            self.ColorFalg = true
        }else if (Yoffset > 120 && self.ColorFalg == true){
            self.navSearchView.backgroundColor = Color_NavBackground
            self.searchTextField.placeholder = "搜索你的递缘吧"
            self.ColorFalg = false
        }else if (Yoffset < 0 && self.ColorFalg == true){
            self.navSearchView.backgroundColor = UIColor.clear
            self.searchTextField.placeholder = "搜索"
            self.ColorFalg = false
        }
        
        
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 6{
            self.searchTextField.frame = CGRect(x: 10, y: 30, width: ScreenWidth - 20, height: 30)
        }
    }
    
    /// 隐藏状态栏
//        override var prefersStatusBarHidden: Bool {
//            return true
//        }

//    override var preferredStatusBarStyle: UIStatusBarStyle{
//        return  UIStatusBarStyle.lightContent
//    }
//
//    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    



}
