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
        
        self.initUI()
        self.initButtomTable()
        self.initNavSearchView()
        
       
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)

        if let cell = self.bottomTableView.cellForRow(at: IndexPath(row: 0, section: 0)){
            (cell as! topScrollViewCell).cycleScrollView.adjustWhenControllerViewWillAppera()
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    override func viewWillDisappear(_ animated: Bool) {

    }
    
    //MARK: - initUI
    func initUI(){
        self.view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationController?.navigationBar.barStyle = .blackTranslucent
        self.setNeedsStatusBarAppearanceUpdate()
        
    }
   
    func initButtomTable(){
        self.bottomTableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: self.view.bounds.height - (self.tabBarController?.tabBar.frame.height)!))
        self.bottomTableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "commoncell")
        self.bottomTableView.register(topScrollViewCell.classForCoder(), forCellReuseIdentifier: "topscrollcell")
        self.bottomTableView.register(secondTableViewCell.classForCoder(), forCellReuseIdentifier: "secondcell")
    self.bottomTableView.register(UINib(nibName:"threeTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "threeTableViewCell")
        
        self.bottomTableView.delegate = self
        self.bottomTableView.dataSource = self
        self.view.addSubview(self.bottomTableView)
        
    }
    func initNavSearchView(){
        
        self.navSearchView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 65))
        self.navSearchView.backgroundColor = Color_NavBackground
        self.navSearchView.backgroundColor = UIColor.clear
        self.view.addSubview(navSearchView)
        
        
        self.searchTextField = UITextField(frame: CGRect(x: ScreenWidth*0.8, y: 30, width: ScreenWidth*0.2-15, height: 30))
        self.searchTextField.borderStyle = .roundedRect
        self.searchTextField.backgroundColor = UIColor.white
        self.searchTextField.placeholder = "搜索"
        self.searchTextField.font = UIFont(name: "SentyTEApro", size: 15)
        self.searchTextField.adjustsFontSizeToFitWidth = true
        self.navSearchView.addObserver(self, forKeyPath: "backgroundColor", options: NSKeyValueObservingOptions.new, context: nil)
        self.navSearchView.addSubview(self.searchTextField)
        
    }

    //MARK: - KVO DELEGATE
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (keyPath == "backgroundColor" ){
            
        let alpha = change?[NSKeyValueChangeKey.newKey] as! UIColor
//                print("color chaneg")
            if alpha == Color_NavBackground{
 
                print("------haha tong")
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 20, initialSpringVelocity: 6, options: UIViewAnimationOptions.curveEaseIn, animations: {
                    self.searchTextField.frame = CGRect(x: 10, y: 30, width: ScreenWidth - 20, height: 30)
                }, completion: { (finish) in
                    
                })
            
            }
            if alpha == UIColor.clear{
                
                print("------haha tong")
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 15, initialSpringVelocity: 5, options: UIViewAnimationOptions.curveEaseIn, animations: {
                    self.searchTextField.frame = CGRect(x: ScreenWidth*0.8, y: 30, width: ScreenWidth*0.2-15, height: 30)
                    
                
                }, completion: { (finish) in
                    
                })
                
             
            }
            
        }
        
    }
   
     //MARK: TableView Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1:
            return 5
        case 2:
            return 5
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
            
        default:
            return 20
        }
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.row,indexPath.section) {
        case (0,0):
            return 200
        case (0,1):
            return 120
        default:
            return 260
        }
       
       
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
      
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch (indexPath.row,indexPath.section) {
        case (0,0):
            print("------dequeReusable  topscroller-----")
            let cell = tableView.dequeueReusableCell(withIdentifier: "topscrollcell", for: indexPath) as! topScrollViewCell
            
            cell.cycleScrollView.imageURLStringsGroup = cell.initImagesNameArray()
            return cell
        case (0,1):
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondcell", for: indexPath)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "threeTableViewCell", for: indexPath)
//            cell.contentView.frame = CGRect(x: 10, y: 0, width: ScreenWidth-20, height: 100)
            return cell
        }

       
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentofset = scrollView.contentOffset
//        print("--\(contentofset)---")
        
        let Yoffset = contentofset.y
        if (0 <= Yoffset && Yoffset <= 120){
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
        print(indexPath)
        
        
        
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
    
     //MARK: ------
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    



}
