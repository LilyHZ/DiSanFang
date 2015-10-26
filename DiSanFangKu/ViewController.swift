//
//  ViewController.swift
//  DiSanFangKu
//
//  Created by xly on 15/8/21.
//  Copyright (c) 2015年 Lily. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    var data:[String] = ["tableView分组显示","分组显示+任意字母排序","左右侧滑菜单","可展开可收缩的表视图(仿QQ通讯录)","地址选择器(自定义控件)"]
    
    var tableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView = UITableView(frame: self.view.bounds)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(tableView)
        self.tableView.separatorColor = UIColor.redColor()
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell2")
        self.tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden = false
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell2", forIndexPath: indexPath) 
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel!.text = data[indexPath.row]
        cell.textLabel!.numberOfLines = 4
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tabBarController?.tabBar.hidden = true
        switch(indexPath.row){
        case 0:
            self.performSegueWithIdentifier("group", sender: nil)
        case 1:
            self.performSegueWithIdentifier("groupAny", sender: nil)
        case 2:
            // create viewController code...
            let storyBoard = UIStoryboard(name: "SliderBoard", bundle: nil)
            let leftViewController = storyBoard.instantiateViewControllerWithIdentifier("LeftTableViewController") as! LeftTableViewController
            
            let rightViewController = storyBoard.instantiateViewControllerWithIdentifier("RightViewController") as! RightViewController
            
            let view0 = UIViewController()
            view0.view.backgroundColor = UIColor.purpleColor()
            let mainViewController = view0//storyBoard.instantiateViewControllerWithIdentifier("ContentsOneViewController") as! ContentsOneViewController
            
            let nvc = UINavigationController(rootViewController: mainViewController)
            
            let slideMenuController = SlideMenuController(mainViewController: nvc, leftMenuViewController: leftViewController, rightMenuViewController: rightViewController)
            
            mainViewController.addLeftBarButtonWithImage(UIImage(named: "ic_menu_black_24dp")!)
            mainViewController.addRightBarButtonWithImage(UIImage(named:"ic_notifications_black_24dp")!)
//            self.presentViewController(slideMenuController, animated: true, completion: nil)
            self.navigationController?.pushViewController(slideMenuController, animated: true)
        case 3:
            self.performSegueWithIdentifier("Quotationidentifier", sender: nil)
        case 4:
            let view = AddressViewController()
            self.navigationController?.pushViewController(view, animated: true)
        default :
            print("ssss", terminator: "")
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

