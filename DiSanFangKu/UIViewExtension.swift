//
//  UIViewExtension.swift
//  DiSanFangKu
//
//  Created by xly on 15/8/22.
//  Copyright (c) 2015年 Lily. All rights reserved.
//

import Foundation


extension UIView{
    /**
    扩展就是向一个已有的类、结构体或枚举类型添加新的功能，包括在木有获取源代码的情况下扩展类型的能力，也称为逆向建模
    *  可以扩展UI组件，类型Int等等
        
        向已有的类型添加新的实例方法和类型方法
        向已有的类型添加实例属性和计算属性
        向已有的类型添加新的构造器
        向已有的类型添加新的下标
    
        只要继承UIView的类都能调用扩展中的方法
    
    */
    
    func sayHello(){
        print("swift欢迎你~~~", terminator: "")
    }
}