//
//  AddressViewController.swift
//  DiSanFangKu
//
//  Created by xly on 15/9/25.
//  Copyright (c) 2015年 Lily. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController ,UITextFieldDelegate{

    var textFile:UITextField!
    var location:AreaObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.textFile = UITextField(frame: CGRectMake(10, 100, self.view.frame.width-20, 40))
        self.textFile.layer.borderWidth = 1.0
        self.textFile.delegate = self
        
        self.view.addSubview(textFile)
    }
    
    func textFieldDidBeginEditing(textField: UITextField){
        self.textFile.resignFirstResponder()
        let ss = AddressChoicePickerView()
        
        //方式一
        ss.block = {(locate:AreaObject) ->Void in
            self.textFile.text = "\(locate.region)\(locate.province)\(locate.city)\(locate.area)"
        }
        
        //方式二
        //ss.block =self.selectionHandler
        
        self.presentViewController(ss, animated: true, completion: nil)
        
    }
    
    //方式二
    func selectionHandler(locate:AreaObject){
        self.textFile.text = "\(locate.region)\(locate.province)\(locate.city)\(locate.area)"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

