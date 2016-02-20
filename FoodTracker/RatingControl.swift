//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Damilare Onajole on 20/02/2016.
//  Copyright © 2016 Damilare Onajole. All rights reserved.
//

import UIKit

class RatingControl: UIView {

    
    // MARK: Properties
    var rating = 0
    var ratingButtons = [UIButton]()
    var spacing = 5
    var stars = 5
    
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for _ in 0..<stars {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            
            button.adjustsImageWhenDisabled = false
            
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            
            
            ratingButtons += [button]
            addSubview(button)
        }

    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 240, height: 44)
    }
    
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
//        updateButtonSelectionStates()
    }
    
//    override func intrinsicContentSize() -> CGSize {
//        let stars = 5
//        let spacing = 10
//        let buttonSize = Int(frame.size.height)
//        let width = (buttonSize + spacing) * stars
//        
//        return CGSize(width: width, height: buttonSize)
//    }
    
    // MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        rating = ratingButtons.indexOf(button)! + 1
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        print("Updating stars..")
        for(index, button) in ratingButtons.enumerate() {
            button.selected = index < rating
        }
    }

}
