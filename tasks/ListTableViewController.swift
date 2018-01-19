//
//  ListTableViewController.swift
//  tasks
//
//  Created by Rachel Ng on 1/17/18.
//  Copyright © 2018 Rachel Ng. All rights reserved.
//

import UIKit
import CoreData

class ListTableViewController: UITableViewController, AddViewControllerDelegate{
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var storedData: [Item] = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAndReload()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print(sender)
        let navigationController = segue.destination as! UINavigationController
        let addViewController = navigationController.topViewController as! AddViewController
        addViewController.delegate = self
        if let theItem = sender as? Item {
            addViewController.itemToEdit = sender as? Item
        }
    }
    
    //MARK: CoreData
    func fetchAndReload() {
        do {
            let fetchData = try managedObjectContext.fetch(Item.fetchRequest()) as [Item]
            storedData = fetchData
        } catch {
            print(error)
        }
        tableView.reloadData()
    }
    
    func saveData() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                print(error)
            }
        }
        fetchAndReload()
    }
    
    //MARK: Delegate
    func addItem(by controller: AddViewController, item: String?, didEdit: Item?) {
        navigationController?.popViewController(animated: true)
        
        if let editedItem = didEdit {
            editedItem.item = item
        } else {
            let newItem = Item(context: managedObjectContext)
            newItem.item = item
        }
        saveData()
        dismiss(animated: true, completion: saveData)
    }

    func cancelSave(by controller: AddViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storedData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = storedData[indexPath.row].item
        return cell
    }
    
    //Get the clicked item/row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected")
    }
    
    //Tap the accessory icon for action
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let itemToEdit = storedData[indexPath.row]
        performSegue(withIdentifier: "EditItemSegue", sender: itemToEdit)
    }
    
    //Swipe to delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let toDelete = storedData[indexPath.row]
        managedObjectContext.delete(toDelete)
        saveData()
    }
    
}
