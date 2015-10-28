//
//  Table1ViewController.swift
//  DiSanFangKu
//
//  Created by xly on 15/8/21.
//  Copyright (c) 2015年 Lily. All rights reserved.
//

import UIKit
import Heimdall

class Table1ViewController: UITableViewController {

    var data:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.data = [
            "MJRefresh刷新控件+SwipeableCell左滑编辑+EAintroView引导页面",
            "ProgressHUD进度提示控件+XActionSheet上拉菜单(自定义组件)+DoImagePicker照片选器",
            "PathCover个人主页+SDWebImage异步加载图片(清除图片缓存)+Extension扩展+自定义类型",
            "PhotoBrowser照片浏览器","自定义scrollView","图片滚动效果1","图片滚动效果2"
        ]
        
        self.tableView.tableFooterView = UIView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("table1Cell", forIndexPath: indexPath) 
        
        cell.textLabel!.text = data[indexPath.row]
        cell.textLabel!.numberOfLines = 4
        
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch(indexPath.row){
        case 0:
            self.performSegueWithIdentifier("MJRefresh", sender: nil)
        case 1:
            self.performSegueWithIdentifier("ProgressHUD", sender: nil)
        case 2:
            self.performSegueWithIdentifier("PathCover", sender: nil)
        case 3:
            self.performSegueWithIdentifier("PhotoBrowser", sender: nil)
        case 4:
            let vc = ScrollViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 5:
            let vc = ImageScroll1ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 6:
            let vc = ImageScroll2ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        default :
            print("ssss", terminator: "")
        }
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
}
