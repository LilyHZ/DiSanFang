//
//  AddressChoicePickerView.swift
//  AddressPickerView
//
//  Created by xly on 15/9/24.
//  Copyright (c) 2015年 Lily. All rights reserved.
//

import UIKit

class AddressChoicePickerView: UIViewController ,UIPickerViewDataSource,UIPickerViewDelegate{

    var block:((locate:AreaObject) -> Void)?
    
    var pickView:UIPickerView!
    var locate:AreaObject = AreaObject()
    //区域 数组
    var regionArr:NSArray! = []
    //省 数组
    var provinceArr:NSArray! = []
    //城市 数组
    var cityArr:NSArray! = []
    //区县 数组
    var areaArr:NSArray = []
    
    var layview:UIView!
    var width:CGFloat!
    var height:CGFloat!
    //取消按钮
    var cancleButton:UIButton!
    //确定按钮
    var doneButton:UIButton!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.width = self.view.bounds.width
        self.height = self.view.bounds.height
        
        //设置view呈现的方式
        self.modalPresentationStyle = UIModalPresentationStyle.OverFullScreen
        
        //设置背景为透明
        self.view.backgroundColor = UIColor.clearColor()
        //点击背景或者取消按钮，下拉菜单消失
        let tap = UITapGestureRecognizer(target: self, action: "tap")
        self.view.addGestureRecognizer(tap)
        
        let url = NSBundle.mainBundle().URLForResource("AreaPlist", withExtension: ".plist")
        self.regionArr = NSArray(contentsOfURL: url!)!
        self.provinceArr = self.regionArr[0]["provinces"] as! NSArray
        self.cityArr = self.provinceArr[0]["cities"] as! NSArray
        self.areaArr = self.cityArr[0]["areas"] as! NSArray
        
        self.locate.region = self.regionArr[0]["region"]!! as! NSString
        self.locate.province = self.provinceArr[0]["province"]!! as! NSString
        self.locate.city = self.cityArr[0]["city"]!! as! NSString
        if (self.areaArr.count > 0) {
            self.locate.area = self.areaArr[0] as! NSString
        }else{
            self.locate.area = "";
        }
        
        self.block?(locate:self.locate)
        
        jiemian()
    }

    /**
    pickview消失
    */
    func tap(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    /**
    确定按钮
    */
    func doneBtn(){
        self.block?(locate:self.locate)
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    required init? (coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /**
    绘制界面
    */
    private func jiemian(){
        self.layview = UIView(frame: CGRectMake(0, self.height*4/7 - 35 , self.width, self.height*3/7 + 35))
        self.layview.backgroundColor = UIColor.grayColor()
        self.layview.alpha = 0.8
        self.view.addSubview(self.layview)
        
        self.cancleButton = UIButton(frame: CGRectMake(5, 0, 50, 35))
        self.cancleButton.setTitle("取消", forState: UIControlState.Normal)
        self.cancleButton.addTarget(self, action: "tap", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.doneButton = UIButton(frame: CGRectMake(self.width-60, 0, 50, 35))
        self.doneButton.setTitle("确定", forState: UIControlState.Normal)
        self.doneButton.addTarget(self, action: "doneBtn", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.layview.addSubview(self.cancleButton)
        self.layview.addSubview(self.doneButton)
        
        self.pickView = UIPickerView(frame: CGRectMake(0, 35, self.width, self.layview.frame.height-35))
        pickView.backgroundColor = UIColor.whiteColor()
        self.pickView.delegate = self
        self.pickView.dataSource = self
        
        self.layview.addSubview(self.pickView)
    }
    
    /**
    每列显示的文字
    */
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        switch(component){
        case 0:
            return (self.regionArr[row]["region"]!! as! String)
        case 1:
            return (self.provinceArr[row]["province"]!! as! String)
        case 2:
            return (self.cityArr[row]["city"]!! as! String)
        default:
            if(self.areaArr.count>0){
                return (self.areaArr[row] as! String)
            }else{
                return ""
            }
        }
    }
    
    /**
    每列文字显示的字体样式
    */
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView{
        
        let pickerLabel = UILabel()
        pickerLabel.minimumScaleFactor = 8.0
        pickerLabel.adjustsFontSizeToFitWidth = true
        pickerLabel.textAlignment = NSTextAlignment.Center
        pickerLabel.backgroundColor = UIColor.clearColor()
        pickerLabel.font = UIFont.boldSystemFontOfSize(15)
        
        pickerLabel.text = self.pickerView(pickerView, titleForRow: row, forComponent: component)
        
        return pickerLabel
    }
    
    /**
    选中每列文字改动
    */
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        switch(component){
        case 0:
            self.provinceArr = self.regionArr[row]["provinces"]!! as! NSArray
            self.pickView.reloadComponent(1)
            self.pickView.selectRow(0, inComponent: 1, animated: true)
            
            self.cityArr = self.provinceArr[0]["cities"]!! as! NSArray
            self.pickView.reloadComponent(2)
            self.pickView.selectRow(0, inComponent: 2, animated: true)
            
            self.areaArr = self.cityArr[0]["areas"]!! as! NSArray
            self.pickView.reloadComponent(3)
            self.pickView.selectRow(0, inComponent: 3, animated: true)
            
            self.locate.region = self.regionArr[row]["region"]!! as! NSString
            self.locate.province = self.provinceArr[0]["province"]!! as! NSString
            self.locate.city = self.cityArr[0]["city"]!! as! NSString
            if (self.areaArr.count > 0) {
                self.locate.area = self.areaArr[0] as! NSString
            }else{
                self.locate.area = "";
            }
        case 1:
            
            self.cityArr = self.provinceArr[row]["cities"]!! as! NSArray
            self.pickView.reloadComponent(2)
            self.pickView.selectRow(0, inComponent: 2, animated: true)
            
            
            self.areaArr = self.cityArr[0]["areas"]!! as! NSArray
            self.pickView.reloadComponent(3)
            self.pickView.selectRow(0, inComponent: 3, animated: true)
            
            self.locate.province = self.provinceArr[0]["province"]!! as! NSString
            self.locate.city = self.cityArr[0]["city"]!! as! NSString
            if (self.areaArr.count > 0) {
                self.locate.area = self.areaArr[0] as! NSString
            }else{
                self.locate.area = "";
            }
        case 2:
            self.areaArr = self.cityArr[row]["areas"]!! as! NSArray
            self.pickView.reloadComponent(3)
            self.pickView.selectRow(0, inComponent: 3, animated: true)
            
            self.locate.city = self.cityArr[0]["city"]!! as! NSString
            if (self.areaArr.count > 0) {
                self.locate.area = self.areaArr[0] as! NSString
            }else{
                self.locate.area = "";
            }
        case 3:
            self.locate.city = self.cityArr[row]["city"]!! as! NSString
            if (self.areaArr.count > 0) {
                self.locate.area = self.areaArr[row] as! NSString
            }else{
                self.locate.area = "";
            }
            
        default:
            print("", terminator: "")
        }
        
    }
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 4
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        switch(component){
        case 0:
            return self.regionArr.count
        case 1:
            return self.provinceArr.count
        case 2:
            return self.cityArr.count
        default:
            return self.areaArr.count
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
