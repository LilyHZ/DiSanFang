//
//  KCMainViewController.swift
//  Demo2
//
//  Created by xly on 15/8/30.
//  Copyright (c) 2015年 xlx. All rights reserved.
//

import UIKit

class KCMainViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    var contacts:NSMutableArray!//联系人模型
    var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView = UITableView(frame: CGRectMake(0, 66, self.view.frame.width, self.view.frame.height), style: UITableViewStyle.Grouped)//(frame: self.view.frame, style: UITableViewStyle.Grouped)
        self.view.addSubview(self.tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        self.initData()
        
        self.tableView.reloadData()
        
        self.tableView.sectionIndexColor = UIColor.redColor()
    }
    
    func initData(){
        contacts = NSMutableArray()
        
        let contact1 = KCContact(firstName: "Cui", lastName: "Kenshin", phoneNumber: "18500131234")
        let contact2 = KCContact(firstName: "Cui", lastName: "Tom", phoneNumber: "18500131237")
        let group1 = KCContactGroup(name: "C", detail: "With names beginning with C", contacts: NSMutableArray(objects: contact1,contact2))
        contacts.addObject(group1)
        
        let contact3 = KCContact(firstName: "Lee", lastName: "Terry", phoneNumber: "18500131238")
        let contact4 = KCContact(firstName: "Lee", lastName: "Jack", phoneNumber: "18500131239")
        let contact5 = KCContact(firstName: "Lee", lastName: "Rose", phoneNumber: "18500131240")
        let group2 = KCContactGroup(name: "L", detail: "With names beginning with L", contacts: NSMutableArray(objects: contact3,contact4,contact5))
        contacts.addObject(group2)
        
        let contact6 = KCContact(firstName: "Sun", lastName: "Kaoru", phoneNumber: "18500131241")
        let contact7 = KCContact(firstName: "Sun", lastName: "Rosa", phoneNumber: "18500131242")
        let group3 = KCContactGroup(name: "S", detail: "With names beginning with S", contacts: NSMutableArray(objects: contact6,contact7))
        contacts.addObject(group3)
        
        let contact8 = KCContact(firstName: "Wang", lastName: "Stephone", phoneNumber: "18500131243")
        let contact9 = KCContact(firstName: "Wang", lastName: "Lucy", phoneNumber: "18500131244")
        let contact10 = KCContact(firstName: "Wang", lastName: "Emily", phoneNumber: "18500131245")
        let contact11 = KCContact(firstName: "Wang", lastName: "Andy", phoneNumber: "18500131246")
        let group4 = KCContactGroup(name: "W", detail: "With names beginning with W", contacts: NSMutableArray(objects: contact8,contact9,contact10,contact11))
        contacts.addObject(group4)
        
        let contact12 = KCContact(firstName: "Zhang", lastName: "Joy", phoneNumber: "18500131247")
        let contact13 = KCContact(firstName: "Zhang", lastName: "Vivan", phoneNumber: "18500131248")
        let contact14 = KCContact(firstName: "Zhang", lastName: "Joyse", phoneNumber: "18500131249")
        let group5 = KCContactGroup(name: "Z", detail: "With names beginning with Z", contacts: NSMutableArray(objects: contact12,contact13,contact14))
        contacts.addObject(group5)
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        NSLog("生成单元格(组：%i,行%i)",indexPath.section,indexPath.row);
        
        let group:KCContactGroup = contacts[indexPath.section] as! KCContactGroup
        let contact:KCContact = group.contacts[indexPath.row] as! KCContact
        
//        var cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.textLabel?.text = contact.getName()
        cell.detailTextLabel?.text = contact.phoneNumber
        
        return cell
    }
    
    /**
    返回分组数
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return contacts.count
    }
    
    /**
    返回每组行数
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NSLog("计算每组(组%i)行数",section)
        
        let group:KCContactGroup = contacts[section] as! KCContactGroup
        
        return group.contacts.count
    }
    
    /**
    返回每组标题名称
    */
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let group:KCContactGroup = contacts[section] as! KCContactGroup
        
        NSLog("生成组（组%i）标题名称:%@",section,group.name);
        return group.name
    }
    
    /**
    返回每组尾部说明
    */
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let group:KCContactGroup = contacts[section] as! KCContactGroup
        
        NSLog("生成组（组%i）尾部说明:%@",section,group.detail!);
        return group.detail
    }
    
    /**
    返回每组标题索引 右侧边竖着显示
    */
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        NSLog("生成组索引");

//        let indexs:NSMutableArray = NSMutableArray()
        var indexs = [String]()
        for(var i:Int=0;i<contacts.count;i++){
            let group:KCContactGroup = contacts[i] as! KCContactGroup
            
//            indexs.addObject(group.name)
            indexs.append(group.name)
        }
        return indexs//(indexs as? [String])
    }
    
    /**
    点击右侧索引表项时调用
    */
//    func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int{
//    
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
