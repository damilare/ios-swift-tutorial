//
//  ViewController.swift
//  FoodTracker
//
//  Created by Damilare Onajole on 20/02/2016.
//  Copyright © 2016 Damilare Onajole. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    
    
    // MARK: Actions
    @IBAction func setDefaultlabelText(sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
    }
    
    // MARK: TextField

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        mealNameLabel.text = textField.text
    }

}

