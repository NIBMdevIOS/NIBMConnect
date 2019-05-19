//
//  FriendsViewController.swift
//  NIBMConnect
//
//  Created by Chan on 5/19/19.
//  Copyright © 2019 Thilakshi Bandara. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class FriendsViewController: UIViewController {

    var ref: DatabaseReference!
    var friendList:[Friend] = []
    var Student:Friend? = nil
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        self.tableview.dataSource = self
        self.tableview.delegate = self
        getFriendsFromDb()

    }
    
    func getFriendsFromDb()  {
        
        self.ref.child("friends").observeSingleEvent(of: .value) { (snapshot) in
            //get user value
            var friends:[Friend] = []
            
            for friend in snapshot.children.allObjects as! [DataSnapshot]{
                
                let friendObject = friend.value as? [String:AnyObject]
                
                let newFriend = Friend(
                    fName: friendObject!["fullName"] as! String,
                    lName: friendObject!["lastName"] as? String,
                    city: friendObject!["city"] as? String,
                    birthday: friendObject!["birthday"] as? String,
                    phoneNum: friendObject!["phoneNumber"] as? String,
                    img: friendObject!["img_url"] as? String)
                
                friends.append(newFriend)
            }
            
            self.friendList = friends
            self.tableview.reloadData()
            
        }
    }
    
}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let friend = friendList[indexPath.row]
        
        let cell:FriendTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendTableViewCell
        
        cell.setUpFriendData(friend: friend)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        Student = friendList[indexPath.row]
        performSegue(withIdentifier: "detailsSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue"{
//            if let nextViewController = segue.destination as? PersonalDetailsViewController {
//                nextViewController.friendObject = Student
//            }
        }
    }
    
}
