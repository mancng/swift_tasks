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

    @IBOutlet var textField: UITextField!
    
    @IBAction func saveBtnPressed(_ sender: UIBarButtonItem) {
        let text = textField.text!
        if text.count > 0 {
            delegate?.itemSaved(by: self, with: text, at: indexPath)
        }
    }
    
    @IBAction func cancelBtnPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelSave(by: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = item
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
