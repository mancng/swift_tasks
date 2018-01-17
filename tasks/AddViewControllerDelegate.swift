//
//  AddViewControllerDelegate.swift
//  tasks
//
//  Created by Rachel Ng on 1/17/18.
//  Copyright © 2018 Rachel Ng. All rights reserved.
//

import UIKit

protocol  AddViewControllerDelegate: class {
    func itemSaved(by controller: AddViewController, with text: String, at indexPath: NSIndexPath?)
    func cancelSave(by controller: AddViewController)
}
