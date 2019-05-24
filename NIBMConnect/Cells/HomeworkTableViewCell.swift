//
//  HomeworkTableViewCell.swift
//  NIBMConnect
//
//  Created by Chan on 5/24/19.
//  Copyright © 2019 Thilakshi Bandara. All rights reserved.
//

import UIKit

class HomeworkTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!

    @IBOutlet weak var lecturerName: UILabel!
    @IBOutlet weak var deadline: UILabel!
    @IBOutlet weak var desc: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    func setUppData(homework: Homework){
        
        title.text = homework.title
        lecturerName.text = homework.lecturerName
        deadline.text = homework.deadlineDate
        desc.text = homework.description
        
    }

}
