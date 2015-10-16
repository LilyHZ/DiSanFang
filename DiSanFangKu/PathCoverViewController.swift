//
//  PathCoverViewController.swift
//  DiSanFangKu
//
//  Created by xly on 15/8/21.
//  Copyright (c) 2015年 Lily. All rights reserved.
//

import UIKit

class PathCoverViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var objectArray = [String]()
    var tableView:UITableView!
    var i = 0
    var path:XHPathCover!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView = UITableView(frame: self.view.frame)
        self.view.addSubview(self.tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.tableView.tableFooterView = UIView()
        
        for i ; i < 10 ; i++ {
            self.objectArray.append("\(i)")
        }
        
        path = XHPathCover(frame: CGRectMake(0, 0, self.view.frame.width, 200))
        path.setBackgroundImage(UIImage(named: "BG"))//设置背景图
        path.setAvatarImage(UIImage(named: "cute_girl.jpg"))//设置图像
        path.isZoomingEffect = true//设置下拉时背景图片放大模糊的效果
//        path.setInfo(NSDictionary(objectsAndKeys: "Lily",XHUserNameKey,"iOS工程师",XHBirthdayKey) as [NSObject : AnyObject])//设置详细个人信息
        path.setInfo([XHUserNameKey:"Lily",XHBirthdayKey:"iOS工程师"])//设置详细个人信息
        path.avatarButton.layer.cornerRadius = 33//图像设为圆角
        path.avatarButton.layer.masksToBounds = true
        path.handleRefreshEvent = {() ->Void in
            self.headRefresh()
        }//下拉刷新是一个闭包
        
        //或者这么写也行
//        path.handleRefreshEvent = {
//            self.headRefresh()
//        }
        
//        self.tableView.tableHeaderView = path
        
        self.tableView.addGifFooterWithRefreshingTarget(self, refreshingAction: "footRefresh")
        
        /**
        清除缓存 清除硬盘和内存中的缓存
        */
        SDImageCache.sharedImageCache().cleanDisk()
        SDImageCache.sharedImageCache().clearMemory()
        
        /**
        扩展的例子
        */
//        self.tableView.tableHeaderView!.sayHello()
//        path.sayHello()
        
        /**
        自定义类型的例子
        */
        let line = LineView(frame: CGRectMake(0, 200, self.view.frame.width, 60))
        
        //因为path下拉有放大和模糊的效果，因此将path和line作为一个整体，self.tableView.tableHeaderView = path要注释
        let head = UIView(frame: CGRectMake(0, 0, self.view.frame.width, 200 + 60))
        head.addSubview(line)
        head.addSubview(path)
        
        self.tableView.tableHeaderView = head
    }
    
    /**
    UITableViewDelegate继承于UIScrollViewDelegate，当我们下拉的时候需要把下拉的一些状态传进来，需要实现UIScrollViewDelegate的一些代理方法
    */
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        path.scrollViewWillBeginDragging(scrollView)
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        path.scrollViewDidEndDragging(scrollView, willDecelerate: decelerate)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        path.scrollViewDidScroll(scrollView)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        path.scrollViewDidEndDecelerating(scrollView)
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
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) 
        
        for view in cell.contentView.subviews{
            view.removeFromSuperview()
        }
        
        let image = UIImageView(frame: CGRectMake(10, 10, 60, 60))
        image.layer.cornerRadius = 30
        image.layer.masksToBounds = true
        image.sd_setImageWithURL(NSURL(string: "http://ac-hn8w3hlp.clouddn.com/fVju6pA4WGzVGNGsVdVXEzB.png"), placeholderImage: UIImage(named: "cute_girl.jpg"))
        cell.contentView.addSubview(image)
        
        let label = UILabel(frame: CGRectMake(80, 30, 100, 20))
        label.text = "这是第\(indexPath.row)行"
        cell.contentView.addSubview(label)

        
        return cell
    }
    
    func headRefresh(){
        self.Delay(2, closure: { () -> () in
            self.objectArray.removeAll(keepCapacity: false)
            self.i = 0
            for self.i ; self.i < 10 ; self.i++ {
                self.objectArray.append("\(self.i)")
            }
            self.tableView.reloadData()
            self.path.stopRefresh()//小球停止转动
        })
    }
    
    func footRefresh(){
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
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
