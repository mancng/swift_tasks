//
//  ListTableViewController.swift
//  tasks
//
//  Created by Rachel Ng on 1/17/18.
//  Copyright © 2018 Rachel Ng. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController, AddViewControllerDelegate{
    
    var listData = ["Dinner on the eiffel tower", "Go to La Sagrada Familia Basilica", "Travel to Santorini"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = listData[indexPath.row]
        return cell
    }
    
    //Get the clicked item/row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected")
    }
    
    //Tap the accessory icon for action
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
    }
    
    //Swipe to delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        listData.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    //MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItemSegue" {
            let navigationController = segue.destination as! UINavigationController
            let addViewController = navigationController.topViewController as! AddViewController
            addViewController.delegate = self
        } else if segue.identifier == "EditItemSegue" {
            let navigationController = segue.destination as! UINavigationController
            let addViewController = navigationController.topViewController as! AddViewController
            addViewController.delegate = self
            let indexPath = sender as! NSIndexPath
            let item = listData[indexPath.row]
            addViewController.item = item
            addViewController.indexPath = indexPath
        }
    }
    
    //MARK: Delegate
    func itemSaved(by controller: AddViewController, with text: String, at indexPath: NSIndexPath?) {
        if let ip = indexPath {
            listData[ip.row] = text
        } else {
            listData.append(text)
        }
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }

    func cancelSave(by controller: AddViewController) {
        dismiss(animated: true, completion: nil)
    }
}
