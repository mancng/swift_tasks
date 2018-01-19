//
//  AddViewControllerDelegate.swift
//  tasks
//
//  Created by Rachel Ng on 1/17/18.
//  Copyright © 2018 Rachel Ng. All rights reserved.
//

import UIKit

protocol  AddViewControllerDelegate: class {
    func addItem(by controller: AddViewController, item: String?, didEdit: Item?)
    func cancelSave(by controller: AddViewController)
}
