//
//  ShopDetailView.swift
//  ShareAlert
//
//  Created by xly on 15/10/19.
//  Copyright © 2015年 Lily. All rights reserved.
//

import UIKit
import Foundation

/// cache文件路径
let cachesPath: String = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true).last!

var ss = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory,NSSearchPathDomainMask.UserDomainMask, true).last!
/// 对UIView的扩展
extension UIView {
    /// X值
    var x: CGFloat {
        return self.frame.origin.x
    }
    /// Y值
    var y: CGFloat {
        return self.frame.origin.y
    }
    /// 宽度
    var width: CGFloat {
        return self.frame.size.width
    }
    ///高度
    var height: CGFloat {
        return self.frame.size.height
    }
    var size: CGSize {
        return self.frame.size
    }
    var point: CGPoint {
        return self.frame.origin
    }
}

class ShopDetailView: UIView {

    private var findLabel: UILabel!
    private var detailLabel: UILabel!
    private var middleLineView: UIView!
    private var bottomLineView: UIView!
    private let bottomLineScale: CGFloat = 0.6
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        
        findLabel = UILabel()
        setLabel(findLabel, text: "店 · 发现", action: "labelClick:", tag: 0)
        
        detailLabel = UILabel()
        setLabel(detailLabel, text: "店 · 详情", action: "labelClick:", tag: 1)
        
        middleLineView = UIView()
        middleLineView.backgroundColor = UIColor.redColor()
        addSubview(middleLineView)
        
        bottomLineView = UIView()
        bottomLineView.backgroundColor = UIColor.blueColor()
        addSubview(bottomLineView)
    }

    private func setLabel(label:UILabel,text:String,action:Selector,tag:Int){
        
        label.text = text
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(20)
        label.textColor = UIColor.blackColor()
        label.userInteractionEnabled = true
        label.tag = tag
        let tap = UITapGestureRecognizer(target: self, action: action)
        label.addGestureRecognizer(tap)
        self.addSubview(label)
    }
    
    func labelClick(tap: UITapGestureRecognizer) {
        let index = tap.view!.tag
    
        let labelW = self.width * 0.5
        let bottomLineW = labelW * bottomLineScale
        let bottomLineH: CGFloat = 1.5
        let bottomLineX: CGFloat = CGFloat(index) * labelW + (labelW - bottomLineW) * 0.5
        let bottomLineY: CGFloat = self.height - bottomLineH
        UIView.animateWithDuration(0.25, animations: { () -> Void in
            self.bottomLineView.frame = CGRectMake(bottomLineX, bottomLineY, bottomLineW, bottomLineH)
        })
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let labelW = self.width * 0.5
        let labelH = self.height
        findLabel.frame = CGRectMake(0, 0, labelW, labelH)
        detailLabel.frame = CGRectMake(labelW, 0, labelW, labelH)
        
        let lineH = labelH * 0.5
        middleLineView.frame = CGRectMake(labelW - 0.5, (labelH - lineH) * 0.5, 1,  lineH)
        let bottomLineW = labelW * bottomLineScale
        bottomLineView.frame = CGRectMake((labelW - bottomLineW) * 0.5, labelH - 1.5, bottomLineW, 1.5)
        
    }
    

}
