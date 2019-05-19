//
//  FriendDetailsViewController.swift
//  NIBMConnect
//
//  Created by Chan on 5/20/19.
//  Copyright © 2019 Thilakshi Bandara. All rights reserved.
//

import UIKit
import Nuke

class FriendDetailsViewController: UIViewController {
    
    var friend: Friend? = nil

    
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var lblFName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phonenumber: UILabel!
    @IBOutlet weak var lblDateOfBirth: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if friend != nil {
            Nuke.loadImage(with: URL(string: (friend?.imgUrl)!)!, into: friendImage)
            
            lblFName.text = friend?.firstName
            lblLastName.text = friend?.lastName
            location.text = friend?.city
            phonenumber.text = friend?.phoneNumber
            lblDateOfBirth.text = friend?.birhday
        }
    }
    

  
}
