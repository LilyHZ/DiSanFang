//
//  XActionSheet.swift
//  DiSanFangKu
//
//  Created by xly on 15/8/23.
//  Copyright (c) 2015年 Lily. All rights reserved.
//

import UIKit

protocol XActionSheetDelegate{
    func buttonClick(index:Int)
}

/**
思路：在一个Controller中添加一个layview(UIView)，再将按钮添加到UIView上，每次添加按钮时，layview上得按钮的位置都要重新计算的，离最新添加的按钮最近的一个按钮y轴就会向下挪添加按钮的高度
*/
class XActionSheet: UIViewController {

    var layview:UIView!
    var width:CGFloat!
    var height:CGFloat!
    //取消按钮
    var cancleButton:UIButton!
    //储存绿色按钮
    var btArray = [UIButton]()
    var delegate:XActionSheetDelegate!
    //每个按钮的高度
    let buttonHeight:CGFloat = 40
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.width = self.view.bounds.width
        self.height = self.view.bounds.height
//        self.btArray = [UIButton]()
        
        //设置view呈现的方式
        self.modalPresentationStyle = UIModalPresentationStyle.OverFullScreen
        
        //设置背景为透明
        self.view.backgroundColor = UIColor.clearColor()
        //点击背景或者取消按钮，下拉菜单消失
        let tap = UITapGestureRecognizer(target: self, action: "tap")
        self.view.addGestureRecognizer(tap)
    }
    
    /**
    下拉菜单消失
    */
    func tap(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /**
    添加取消按钮
    
    当layview不存在时就创建一个，存在时就更改layview的高度，再把取消按钮添加到layview上
    */
    func addCancelButton(title:String){
        if(layview == nil){
            
            //y 屏幕的高度 - 绿色按钮的高度x绿色按钮的个数 - 取消按钮的高度 - 按钮间的间隔
            //高度 绿色按钮的高度x绿色按钮的个数 + 取消按钮的高度 + 按钮间的间隔
            layview = UIView(frame: CGRectMake(width*0.1, height - CGFloat(btArray.count) * buttonHeight - buttonHeight - 30, width*0.8, CGFloat(btArray.count) * buttonHeight + buttonHeight + 20))
            layview.layer.cornerRadius = 5
            layview.layer.masksToBounds = true
            layview.alpha = 0.8
            self.view.addSubview(layview)
        }else{
            //layview存在，在layview目前的高度上加上一个cancleButton的高度
            var currentHeigth = layview.bounds.height
            currentHeigth += 50
            layview = UIView(frame: CGRectMake(width*0.1, height - currentHeigth, width*0.8, currentHeigth))
        }
        
        
        if(cancleButton == nil){
            //y 绿色按钮的高度x绿色按钮的个数 + 按钮间的间隔
            cancleButton = UIButton(frame: CGRectMake(0, CGFloat(btArray.count) * buttonHeight + 10, width*0.8, buttonHeight))
            cancleButton.setTitle(title, forState: UIControlState.Normal)
            cancleButton.layer.cornerRadius = 5
            cancleButton.layer.masksToBounds = true
            cancleButton.backgroundColor = UIColor.brownColor()
            cancleButton.addTarget(self, action: "tap", forControlEvents: UIControlEvents.TouchUpInside)
            layview.addSubview(cancleButton)
        }
    }
    
    /**
    增加按钮
    */
    func addButtonwithTitle(title:String){
        if(layview == nil){
            
            //y 屏幕的高度 - 绿色按钮的高度x绿色按钮的个数 - 取消按钮的高度 - 按钮间的间隔
            //高度 绿色按钮的高度x绿色按钮的个数 + 取消按钮的高度 + 按钮间的间隔
            layview = UIView(frame: CGRectMake(width*0.1,height - (self.buttonHeight + 10), width*0.8, self.buttonHeight + 20))
            layview.layer.cornerRadius = 5
            layview.layer.masksToBounds = true
            layview.alpha = 0.8
            self.view.addSubview(layview)
        }else{
            //layview存在，在layview目前的高度上加上一个cancleButton的高度
            var nowHeight = self.layview.bounds.size.height
            nowHeight += 40
            layview.frame = CGRectMake(width * 0.1, height - nowHeight, width*0.8, nowHeight)
        }
        let btn = UIButton(frame: CGRectMake(0, (CGFloat)(btArray.count)*buttonHeight, width * 0.8, buttonHeight - 1))
        btn.tag = btArray.count
        btn.addTarget(self, action: "buttonClick:", forControlEvents: UIControlEvents.TouchUpInside)
        btn.backgroundColor = UIColor(red: 52/255, green: 170/255, blue: 135/255, alpha: 1)
        btn.setTitle(title, forState: UIControlState.Normal)
        layview.addSubview(btn)
        btArray.append(btn)
        
        if(cancleButton != nil){
            let cancleY = cancleButton.frame.origin.y
            cancleButton.frame = CGRectMake(0, cancleY + buttonHeight, width*0.8, buttonHeight)
        }
    }
    
    /**
    按钮点击事件
    */
    func buttonClick(sender:AnyObject){
        
        self.dismissViewControllerAnimated(true, completion: nil)
        let btn = sender as! UIButton
        delegate.buttonClick(btn.tag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
