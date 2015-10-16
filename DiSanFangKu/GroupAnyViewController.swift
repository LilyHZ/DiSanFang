//
//  GroupAnyViewController.swift
//  DiSanFangKu
//
//  Created by xly on 15/8/31.
//  Copyright (c) 2015年 Lily. All rights reserved.
//

import UIKit

class GroupAnyViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    var tableView:UITableView!
    var stringsToSort = NSArray(array: ["￥hhh, .$"," ￥Chinese ","开源中国 ","www.oschina.net","开源技术","社区","开发者","传播","2014","a1","100","中国","暑假作业","键盘", "鼠标","hello","world","b1"])
    
    var indexArray:NSMutableArray!//索引
    var LetterResultArr:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView = UITableView(frame: CGRectMake(0, 66, self.view.frame.width, self.view.frame.height), style: UITableViewStyle.Grouped)
        self.view.addSubview(self.tableView)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.tableView.sectionIndexColor = UIColor.redColor()
        
        self.indexArray = ChineseString.IndexArray(stringsToSort as [AnyObject])
        self.LetterResultArr = ChineseString.LetterSortArray(stringsToSort as [AnyObject])
        print("\(self.stringsToSort.count)", terminator: "")
    }
    
    /**
    设置分区的头名称
    */
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.indexArray[section] as? String
    }
    /**
    设置分区的头样式
    */
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRectMake(0, 0, self.view.frame.width, 20))
        label.backgroundColor = UIColor.grayColor()
        label.text = self.indexArray[section] as? String
        label.textColor = UIColor.whiteColor()
        return label
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    /**
    设置列索引
    */
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return (self.indexArray.copy() as! [String])
    }
    func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        print("atIndex:\(index)", terminator: "")
        return index
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell")
        let index: AnyObject = self.LetterResultArr[indexPath.section]
        cell!.textLabel?.text = index[indexPath.row] as? String
        return cell!
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 65
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.indexArray.count
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.LetterResultArr[section].count
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
