//
//  ScrollViewController.swift
//  DiSanFangKu
//
//  Created by xly on 15/10/23.
//  Copyright © 2015年 Lily. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()

        let vc = ShopDetailView(frame: CGRect(x: 0, y: 80, width: self.view.frame.width, height:45))
        
        self.view.addSubview(vc)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
