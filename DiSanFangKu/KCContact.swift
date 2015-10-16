//
//  KCContact.swift
//  Demo2
//
//  Created by xly on 15/8/30.
//  Copyright (c) 2015年 xlx. All rights reserved.
//

import Foundation

class KCContact:NSObject{
    var firstName:String?
    var lastName:String?
    var phoneNumber:String?
    
    init(firstName:String,lastName:String,phoneNumber:String) {
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
    }
    
    func getName() -> String{
        return NSString(format: "%@ %@", firstName!,lastName!) as String
    }
    
}
