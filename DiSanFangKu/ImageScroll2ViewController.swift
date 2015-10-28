
//
//  ImageScroll2ViewController.swift
//  DiSanFangKu
//
//  Created by xly on 15/10/28.
//  Copyright © 2015年 Lily. All rights reserved.
//

import UIKit

class ImageScroll2ViewController: UIViewController ,JSAnimatedImagesViewDataSource{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let js = JSAnimatedImagesView(frame: CGRect(x: 0.0, y: 110.0 , width: self.view.frame.width, height: self.view.frame.height - 110))
                js.dataSource = self
        
        self.view.addSubview(js)
    }
    
    func animatedImagesNumberOfImages(animatedImagesView: JSAnimatedImagesView!) -> UInt {
        return 3
    }
    
    func animatedImagesView(animatedImagesView: JSAnimatedImagesView!, imageAtIndex index: UInt) -> UIImage! {
        return UIImage(named: "im\(index + 1)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
