//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Damilare Onajole on 20/02/2016.
//  Copyright © 2016 Damilare Onajole. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var photoImaageView: UIImageView!
    
    @IBOutlet weak var ratingControl: RatingControl!
    
    // MARK: Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
    }
    
    // MARK: TextField  Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
    }

    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true, completion: nil)

    }
    
    // MARK: ImageField Delegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoImaageView.image = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}

