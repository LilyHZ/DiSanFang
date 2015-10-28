
//
//  ImageScroll1ViewController.swift
//  DiSanFangKu
//
//  Created by xly on 15/10/28.
//  Copyright © 2015年 Lily. All rights reserved.
//

import UIKit

class ImageScroll1ViewController: UIViewController ,RCAnimatedImagesViewDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rc = RCAnimatedImagesView(frame: CGRect(x: 0.0, y: 110.0, width: self.view.frame.width, height: self.view.frame.height - 110))
        rc.delegate = self
        rc.startAnimating()
        
        self.view.addSubview(rc)
    }
    
    func animatedImagesNumberOfImages(animatedImagesView: RCAnimatedImagesView!) -> UInt {
        return 3
    }
    
    func animatedImagesView(animatedImagesView: RCAnimatedImagesView!, imageAtIndex index: UInt) -> UIImage! {
        return UIImage(named: "im\(index + 1)")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
