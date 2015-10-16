//
//  LineView.swift
//  DiSanFangKu
//
//  Created by xly on 15/8/22.
//  Copyright (c) 2015年 Lily. All rights reserved.
//

import UIKit

class LineView: UIView {

    var labelArray = ["动态","关注","粉丝","文章","文集"]
    /**
    重载drawRect方法实现画线有三种方法
    
    CGcontextRef：Graphics Context是图像上下问，可理解为一块画布，我们在画布上进行绘画，绘制完成之后我们将它放到我的view中显示即可，view作为一画框。
    CGPath
    UIBezierPath(贝斯尔曲线)
    
    - parameter rect: <#rect description#>
    */
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        //定义一块画布
        let context = UIGraphicsGetCurrentContext()
        
        //定义线的颜色及透明度
        CGContextSetRGBFillColor(context, 0, 0, 0, 0.3)
        
        //定义线的宽度
        CGContextSetLineWidth(context, 0.5)
        
        //画四条竖线
        for i in 1...4{
            //首先把画笔移到起始位置 (x,y)-->(CGFloat(i)*rect.width / 5,10)
            CGContextMoveToPoint(context, CGFloat(i)*rect.width / 5, 10)
            
            //线的终止位置
            CGContextAddLineToPoint(context, CGFloat(i)*rect.width / 5, frame.height - 10)
        }
        
        //添加上下横线
        CGContextMoveToPoint(context, 0, 5)
        CGContextAddLineToPoint(context, frame.width, 5)
        
        CGContextMoveToPoint(context, 0, frame.height - 5)
        CGContextAddLineToPoint(context, frame.width, frame.height - 5)
        
        //把画布添加到view上
        CGContextStrokePath(context)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.whiteColor()
        
        for i in 0...4{
            let label = UILabel(frame: CGRectMake(CGFloat(i)*frame.width/5, frame.height/3, frame.width/5, frame.height/3*2))
            label.text = labelArray[i]
            label.textColor = UIColor.grayColor()
            label.font = UIFont.systemFontOfSize(13)
            label.textAlignment = NSTextAlignment.Center
            
            self.addSubview(label)
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
