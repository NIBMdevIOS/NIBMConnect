//
//  AddHomeworkViewController.swift
//  NIBMConnect
//
//  Created by Chan on 5/24/19.
//  Copyright © 2019 Thilakshi Bandara. All rights reserved.
//

import UIKit

class AddHomeworkViewController: UIViewController {
    
    
    static let homeworkArrayKey = "homeworks"
    
    
    @IBOutlet weak var homeworkTitle: UITextField!
    @IBOutlet weak var homeworkDescription: UITextField!
    @IBOutlet weak var lecturerName: UITextField!
    @IBOutlet weak var deadlineDate: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    
    @IBAction func addHomeworkClick(_ sender: Any) {
        
        if (homeworkTitle.text == "") {
            alert(message: "please add a homework title")
            return
        }
        
        if (homeworkDescription.text == ""){
            alert(message: "Please add a homework description")
            return
        }
        
        let homework = Homework(title: homeworkTitle.text ?? "Homework",
                                description: homeworkDescription.text ?? "",
                                lecturerName: lecturerName.text,
                                deadlineDate: deadlineDate.text)
        
        var homeworkList = UserDefaults.standard.decode(for: [Homework].self, using: String(describing: Homework.self))
        
        
      
        
        if (homeworkList == nil) {
            UserDefaults.standard.encode(for:[homework], using: String(describing: Homework.self))
        } else {
            homeworkList?.append(homework)
            UserDefaults.standard.encode(for:homeworkList, using: String(describing: Homework.self))
        }
        
        navigationController?.popViewController(animated: true)
        
        
        
    }
    

    
}
