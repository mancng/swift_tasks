//
//  AddViewController.swift
//  tasks
//
//  Created by Rachel Ng on 1/17/18.
//  Copyright © 2018 Rachel Ng. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    weak var delegate: AddViewControllerDelegate?
    
    var item: String?
    var indexPath: NSIndexPath?
    var itemToEdit: Item?

    @IBOutlet var textField: UITextField!
    
    @IBOutlet var actionLabel: UILabel!
    
    @IBOutlet var actionButton: UIBarButtonItem!
    
    @IBAction func saveBtnPressed(_ sender: UIBarButtonItem) {
        let text = textField.text!
        if text.count > 0 {
            delegate?.addItem(by: self, item: text, didEdit: itemToEdit)
        }
    }
    
    @IBAction func cancelBtnPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelSave(by: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let myItem = itemToEdit {
            textField.text = myItem.item
            actionLabel.text = "Edit your task"
            actionButton.title = "Save"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
