//
//  ViewController.swift
//  tasks
//
//  Created by Rachel Ng on 1/15/18.
//  Copyright © 2018 Rachel Ng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tasks = ["Something cool", "Something Very Cool", "Something EXTREMELY cool"]
    @IBOutlet var taskTextField: UITextField!
    @IBOutlet var tableView: UITableView!
    @IBAction func addBtnPressed(_ sender: UIButton) {
        
        
        if let newTask = taskTextField.text {
            tasks.append(newTask)
            tableView.reloadData()
            print(tasks)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
}

