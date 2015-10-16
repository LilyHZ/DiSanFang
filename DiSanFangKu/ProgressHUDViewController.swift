//
//  ProgressHUDViewController.swift
//  DiSanFangKu
//
//  Created by xly on 15/8/21.
//  Copyright (c) 2015年 Lily. All rights reserved.
//

import UIKit

class ProgressHUDViewController: UIViewController,XActionSheetDelegate,DoImagePickerControllerDelegate{

    var hud : MBProgressHUD!
    @IBOutlet weak var headImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        headImage.image = UIImage(named: "cute_girl.jpg")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ProgressHUDshow(sender: AnyObject) {
        ProgressHUD.show("亲爱的，别急嘛~~~~")
    }

    @IBAction func ProgressHUDshowError(sender: AnyObject) {
        ProgressHUD.showError("不给力哦~~~")
    }
    
    @IBAction func ProgressHUDshowSuccess(sender: AnyObject) {
        ProgressHUD.showSuccess("加载成功！", interaction: true)
    }
    

    @IBAction func MBProgressHUDShow(sender: AnyObject) {
        ProgressHUD.dismiss()
        hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.labelFont = UIFont(name: "Helvetica", size: 12.0)
        hud.labelText = "努力加载中..."
        hud.detailsLabelFont = UIFont(name: "Helvetica", size: 8.0)
        hud.detailsLabelColor = UIColor(red: 252.0/255.0, green: 182.0/255.0, blue: 110.0/255.0, alpha: 1)
        hud.detailsLabelText = "每一天都在慢慢的进步"
        hud.color = UIColor(red: 69.0/255.0, green: 156.0/255.0, blue: 163.0/255.0, alpha: 1)
    }
    
    @IBAction func ActionSheet(sender: AnyObject) {
        let action = XActionSheet()
        action.delegate = self
        action.addCancelButton("取消")
        action.addButtonwithTitle("拍照")
        action.addButtonwithTitle("相册")
        action.addButtonwithTitle("查看高清大图")
        self.presentViewController(action, animated: true, completion: nil)
        
    }
    
    func buttonClick(index: Int) {
        print("点击第\(index)个按钮", terminator: "")
    }
    
    @IBAction func DoImagePicker(sender: AnyObject) {
        let imagePicker = DoImagePickerController(nibName: "DoImagePickerController", bundle: nil)
        imagePicker.delegate = self
        //选择照片的数目
        imagePicker.nMaxCount = 1
        imagePicker.nColumnCount = 2
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }

    func didCancelDoImagePickerController() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func didSelectPhotosFromDoImagePickerController(picker: DoImagePickerController!, result aSelected: [AnyObject]!) {
        headImage.image = aSelected.first as? UIImage
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
