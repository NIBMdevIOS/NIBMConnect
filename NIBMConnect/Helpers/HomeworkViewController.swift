//
//  HomeworkViewController.swift
//  NIBMConnect
//
//  Created by Chan on 5/24/19.
//  Copyright © 2019 Thilakshi Bandara. All rights reserved.
//

import UIKit

class HomeworkViewController: UIViewController {

    @IBOutlet weak var homeworkTableView: UITableView!

    var homeworkList: [Homework] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        homeworkTableView.dataSource = self
        homeworkTableView.delegate = self
        
    }
    



}

extension HomeworkViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeworkList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) as! FriendTableViewCell
        
      
        
        return cell
    }
    
    
    
    
    
}
