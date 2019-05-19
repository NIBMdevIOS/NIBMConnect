//
//  FriendTableViewCell.swift
//  NIBMConnect
//
//  Created by Chan on 5/19/19.
//  Copyright © 2019 Thilakshi Bandara. All rights reserved.
//

import UIKit
import Nuke


class FriendTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var textFieldFriend: UILabel!
    @IBOutlet weak var friendImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpFriendData(friend: Friend) {
        
        self.textFieldFriend.text = friend.firstName
        
        if (friend.imgUrl != nil && friend.imgUrl != "") {
        Nuke.loadImage(with: URL(string: friend.imgUrl!)!, into: friendImageView)
        }
    }

}
