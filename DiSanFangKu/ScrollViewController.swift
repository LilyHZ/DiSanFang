//
//  ScrollViewController.swift
//  DiSanFangKu
//
//  Created by xly on 15/10/23.
//  Copyright © 2015年 Lily. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()

        let vc = ShopDetailView(frame: CGRect(x: 0, y: 60, width: self.view.frame.width, height:45))
        self.view.addSubview(vc)
        
        
        let filePath = NSBundle.mainBundle().pathForResource("gift1", ofType: "gif")
        let gif = NSData(contentsOfFile: filePath!)
        let webViewBG = UIWebView(frame: CGRect(x: 0, y: 110, width: self.view.frame.width, height:320))
        webViewBG.loadData(gif!, MIMEType: "image/gif", textEncodingName: String(), baseURL: NSURL())
        webViewBG.userInteractionEnabled = false
        
        
        self.view.addSubview(webViewBG)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
