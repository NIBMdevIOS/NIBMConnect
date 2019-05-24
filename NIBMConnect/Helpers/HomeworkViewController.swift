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
        
        title = "My Homeworks"

        homeworkTableView.dataSource = self
        homeworkTableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
         var homeworkDefaultList = UserDefaults.standard.decode(for: [Homework].self, using: String(describing: Homework.self))
        
        homeworkList.removeAll()
        
        homeworkList = homeworkDefaultList ?? []
        
        homeworkTableView.reloadData()
        
    }
    
    
    @IBAction func onAddClick(_ sender: Any) {
        performSegue(withIdentifier: "addHomeworkSegue", sender: nil)
    }
    
}

extension HomeworkViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeworkList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeworkCell", for: indexPath) as! HomeworkTableViewCell
        
        cell.setUppData(homework: homeworkList[indexPath.row])
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    
}
