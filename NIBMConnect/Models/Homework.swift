//
//  Homework.swift
//  NIBMConnect
//
//  Created by Chan on 5/24/19.
//  Copyright © 2019 Thilakshi Bandara. All rights reserved.
//

import Foundation

struct Homework: Codable {
    
    var title:String
    var description:String
    var lecturerName:String?
    var deadlineDate:String?
    
    init(title:String, description:String, lecturerName:String?, deadlineDate:String?) {
        self.title = title
        self.description = description
        self.lecturerName = lecturerName
        self.deadlineDate = deadlineDate

    }
    
}
