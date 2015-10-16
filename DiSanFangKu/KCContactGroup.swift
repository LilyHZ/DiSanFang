//
//  KCContactGroup.swift
//  Demo2
//
//  Created by xly on 15/8/30.
//  Copyright (c) 2015年 xlx. All rights reserved.
//

import Foundation

class KCContactGroup:NSObject{
    var name:String!//组名
    var detail:String?//分组描述
    var contacts:NSMutableArray!//联系人
    
    init(name:String,detail:String,contacts:NSMutableArray){
        super.init()
        self.name = name
        self.detail = detail
        self.contacts = contacts
    }
    
}