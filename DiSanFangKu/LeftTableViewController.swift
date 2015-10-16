//
//  LeftTableViewController.swift
//  DiSanFangKu
//
//  Created by xly on 15/9/21.
//  Copyright (c) 2015年 Lily. All rights reserved.
//

import Foundation
import UIKit

class LeftTableViewController: UITableViewController {
    
    var dataSource = [String]()
    
    var LeftStoryboard = UIStoryboard(name: "SliderBoard", bundle: nil)
    
    var userInfoViewControllerNV: UINavigationController?
    var contentsOneViewControllerNV: UINavigationController?
    var contentsTwoViewControllerNV: UINavigationController?
    var contentsThreeViewControllerNV: UINavigationController?
    var contentsFourViewControllerNV: UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = ["UserInfo","One","Two","Three","Four"]
        
        let userInfoViewController = LeftStoryboard.instantiateViewControllerWithIdentifier("UserInfoViewController") as! UserInfoViewController
        userInfoViewController.addLeftBarButtonWithImage(UIImage(named: "ic_menu_black_24dp")!)
        userInfoViewController.addRightBarButtonWithImage(UIImage(named:"ic_notifications_black_24dp")!)
        self.userInfoViewControllerNV = UINavigationController(rootViewController: userInfoViewController)
        
        let view1 = UIViewController()
        view1.view.backgroundColor = UIColor.blueColor()
        let contentsOneViewController = view1//LeftStoryboard.instantiateViewControllerWithIdentifier("ContentsOneViewController") as! ContentsOneViewController
        contentsOneViewController.addLeftBarButtonWithImage(UIImage(named: "ic_menu_black_24dp")!)
        contentsOneViewController.addRightBarButtonWithImage(UIImage(named:"ic_notifications_black_24dp")!)
        self.contentsOneViewControllerNV = UINavigationController(rootViewController: contentsOneViewController)
        
        let view2 = UIViewController()
        view2.view.backgroundColor = UIColor.yellowColor()
        let contentsTwoViewController = view2//LeftStoryboard.instantiateViewControllerWithIdentifier("ContentsTwoViewController") as! ContentsTwoViewController
        contentsTwoViewController.addLeftBarButtonWithImage(UIImage(named: "ic_menu_black_24dp")!)
        contentsTwoViewController.addRightBarButtonWithImage(UIImage(named:"ic_notifications_black_24dp")!)
        self.contentsTwoViewControllerNV = UINavigationController(rootViewController: contentsTwoViewController)
        
        let view3 = UIViewController()
        view3.view.backgroundColor = UIColor.grayColor()
        let contentsThreeViewController = view3//LeftStoryboard.instantiateViewControllerWithIdentifier("ContentsThreeViewController") as! ContentsThreeViewController
        contentsThreeViewController.addLeftBarButtonWithImage(UIImage(named: "ic_menu_black_24dp")!)
        contentsThreeViewController.addRightBarButtonWithImage(UIImage(named:"ic_notifications_black_24dp")!)
        self.contentsThreeViewControllerNV = UINavigationController(rootViewController: contentsThreeViewController)
        
        let view4 = UIViewController()
        view4.view.backgroundColor = UIColor.redColor()
        let contentsFourViewController = view4//LeftStoryboard.instantiateViewControllerWithIdentifier("ContentsFourViewController") as! ContentsFourViewController
        contentsFourViewController.addLeftBarButtonWithImage(UIImage(named: "ic_menu_black_24dp")!)
        contentsFourViewController.addRightBarButtonWithImage(UIImage(named:"ic_notifications_black_24dp")!)
        self.contentsFourViewControllerNV = UINavigationController(rootViewController: contentsFourViewController)
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return dataSource.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("UserInfoTableViewCell", forIndexPath: indexPath) as! UserInfoTableViewCell
            
            //StoryBoard中已配置好
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("MenuTableViewCell", forIndexPath: indexPath) as! MenuTableViewCell
            
            cell.MenuLabel.text = dataSource[indexPath.row]
            
            //隐藏tableView分割线
            self.tableView.separatorStyle = .None
            
            return cell
        }
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 140
        }
        
        return 60
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        changViewController(indexPath.row)
    }
    
    func changViewController(row: Int) {
        
        switch row {
        case 0:
            self.slideMenuController()?.changeMainViewController(userInfoViewControllerNV!, close: true)
        case 1:
            self.slideMenuController()?.changeMainViewController(contentsOneViewControllerNV!, close: true)
        case 2:
            self.slideMenuController()?.changeMainViewController(contentsTwoViewControllerNV!, close: true)
        case 3:
            self.slideMenuController()?.changeMainViewController(contentsThreeViewControllerNV!, close: true)
        case 4:
            self.slideMenuController()?.changeMainViewController(contentsFourViewControllerNV!, close: true)
        default:
            break
        }
        
    }
    
}
