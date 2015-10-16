//
//  MJRefreshViewController.swift
//  DiSanFangKu
//
//  Created by xly on 15/8/21.
//  Copyright (c) 2015年 Lily. All rights reserved.
//

import UIKit

class MJRefreshViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource,SwipeableCellDelegate,SwipeableCellDataSource,EAIntroDelegate{

    var objectArray = [String]()
    var tableView:UITableView!
    var i = 0
    
    //用来放数组cell的按钮是否打开
    var isEding = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView = UITableView(frame: self.view.frame)
        self.view.addSubview(self.tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
//        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        /**
        *  SwipeableCell
        */
        self.tableView.registerClass(SwipeableCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.tableView.tableFooterView = UIView()
        
        for i ; i < 10 ; i++ {
            self.objectArray.append("\(i)")
        }
        
        self.tableView.addLegendHeaderWithRefreshingTarget(self, refreshingAction: "headRefresh")
        self.tableView.addGifFooterWithRefreshingTarget(self, refreshingAction: "footRefresh")
        
        guidView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        /**
        *  SwipeableCell
        */
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SwipeableCell
        
        for view in cell.containerView.subviews {
            view.removeFromSuperview()
        }
        
        let image = UIImageView(frame: CGRectMake(10, 10, 60, 60))
        image.layer.cornerRadius = 30
        image.layer.masksToBounds = true
        image.sd_setImageWithURL(NSURL(string: "http://ac-hn8w3hlp.clouddn.com/fVju6pA4WGzVGNGsVdVXEzB.png"), placeholderImage: UIImage(named: "cute_girl.jpg"))
        cell.containerView.addSubview(image)
        
        let label = UILabel(frame: CGRectMake(80, 30, 100, 20))
        label.text = "这是第\(indexPath.row)行"
        cell.containerView.addSubview(label)
        
        cell.delegate = self
        cell.dataSource = self
        cell.setNeedsUpdateConstraints()
        if(self.isEding .containsObject(indexPath)){
            cell.openCell(false)
        }else{
            cell.closeCell(false)
        }
        
        return cell
    }
    
    func headRefresh(){
        self.tableView.header.beginRefreshing()
        self.Delay(2, closure: { () -> () in
            self.objectArray.removeAll(keepCapacity: false)
            self.i = 0
            for self.i ; self.i < 10 ; self.i++ {
                self.objectArray.append("\(self.i)")
            }
            self.tableView.header.endRefreshing()
            self.tableView.reloadData()
        })
    }
    
    func footRefresh(){
        self.tableView.footer.beginRefreshing()
        self.Delay(2, closure: { () -> () in
            let j = self.i + 10
            for self.i ; self.i < j ; self.i++ {
                self.objectArray.append("\(self.i)")
            }
            self.tableView.footer.endRefreshing()
            self.tableView.reloadData()
            
        })
    }
    
    func Delay(time:Double,closure:()->()){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
    }
    
    /**
    SwipeableCellDelegate,SwipeableCellDataSource
    */
    func swipeableCell(cell: SwipeableCell!, didSelectButtonAtIndex index: Int) {
        print(index, terminator: "")
        let indexPath = self.tableView.indexPathForCell(cell) as NSIndexPath!
        objectArray.removeAtIndex(indexPath.row)
        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
        self.isEding.removeObject(indexPath)
    }
    func swipeableCellDidOpen(cell: SwipeableCell!) {
        let index = self.tableView.indexPathForCell(cell) as NSIndexPath!
        self.isEding.addObject(index)
    }
    func swipeableCellDidClose(cell: SwipeableCell!) {
        let index = self.tableView.indexPathForCell(cell) as NSIndexPath!
        self.isEding.removeObject(index)
    }
    func numberOfButtonsInSwipeableCell(cell: SwipeableCell!) -> Int {
        return 3
    }
    func swipeableCell(cell: SwipeableCell!, buttonForIndex index: Int) -> UIButton! {
        let btn = UIButton(frame: CGRectMake(0, 0, 60, 60))
        
        switch(index){
        case 0:
            btn.backgroundColor = UIColor.redColor()
            btn.setTitle("删除", forState: UIControlState.Normal)
        case 1:
            btn.backgroundColor = UIColor.orangeColor()
        case 2:
            btn.backgroundColor = UIColor.grayColor()
        default:
            print(index, terminator: "")
        }
        
        return btn
    }
    
    /**
    引导界面
    */
    func guidView(){
        self.navigationController?.navigationBar.hidden = true
        self.tabBarController!.tabBar.hidden = true
        let page1 = EAIntroPage()
        page1.bgImage = UIImage(named: "image1.jpg")
        page1.title = "华于形，美于心"
        page1.titleFont = UIFont.systemFontOfSize(20)
        //坐标是从下往上的
        page1.titlePositionY = 400
        page1.desc = "StrongX的美容医院，欢迎你~~"
        
        let page2 = EAIntroPage()
        page2.bgImage = UIImage(named: "image2.jpg")
        page2.title = "德艺双馨，妙手天成"
        page2.titlePositionY = 400
        page2.titleFont = UIFont.systemFontOfSize(20)
        
        let page3 = EAIntroPage()
        page3.bgImage = UIImage(named: "image3.jpg")
        page3.title = "表面文章，内在功夫"
        page3.titlePositionY = 400
        page3.titleFont = UIFont.systemFontOfSize(20)
        
        let intro = EAIntroView(frame: self.view.frame, andPages: [page1,page2,page3])
        intro.delegate = self
        intro.showInView(self.view)
    }
    func introDidFinish(introView: EAIntroView!) {
        self.navigationController?.navigationBar.hidden = false
        self.tabBarController!.tabBar.hidden = false
    }
    
}
