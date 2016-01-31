//
//  SAStickyHeaderView+Gesture.swift
//  SAStickyHeaderExample
//
//  Created by shams ahmed on 18/10/2015.
//  Copyright © 2015 SA. All rights reserved.
//

import UIKit

extension SAStickyHeaderView: UIGestureRecognizerDelegate {
    
    // MARK:
    // MARK: Gesture
    
    internal func didSwipeImageView(sender: UISwipeGestureRecognizer) {
        updateImageWithDirection(sender.direction)
    }
    
    internal func didTapHeaderView(sender: UISwipeGestureRecognizer) {
        // Unimplemented method
    }
    
    // MARK:
    // MARK: UIGestureRecognizerDelegate
    
    public func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        isTouchingView = touch.view?.superview == self
        
        return true
    }
}
