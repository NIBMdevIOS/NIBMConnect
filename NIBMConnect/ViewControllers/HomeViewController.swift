//
//  HomeViewController.swift
//  NIBMConnect
//
//  Created by Oshan Madushanka on 5/18/19.
//  Copyright © 2019 Thilakshi Bandara. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func myFriendsAAction(_ sender: Any) {
        performSegue(withIdentifier: "homeToFriends", sender: nil)
    }
    
    @IBAction func homeworkAction(_ sender: Any) {
        performSegue(withIdentifier: "homeToHomework", sender: nil)
    }
    
    @IBAction func profileaction(_ sender: Any) {
        performSegue(withIdentifier: "homeToProfile", sender: nil)
    }
    

}
