//
//  Friend.swift
//  NIBMConnect
//
//  Created by Chan on 5/19/19.
//  Copyright © 2019 Thilakshi Bandara. All rights reserved.
//

import Foundation

class Friend {
    
    var firstName:String
    var lastName:String?
    var city:String?
    var birhday:String?
    var phoneNumber:String?
    var imgUrl:String?
    
    init(fName:String, lName:String?, city:String?, birthday:String?, phoneNum:String?, img:String?) {
        self.birhday = birthday
        self.firstName = fName
        self.lastName = lName
        self.phoneNumber = phoneNum
        self.city = city
        self.imgUrl = img
    }
    
}
