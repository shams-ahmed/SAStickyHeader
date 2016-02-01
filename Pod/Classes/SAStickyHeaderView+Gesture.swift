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
    
    internal func didTapHeaderView(sender: UIGestureRecognizer) {
        guard #available(iOS 9, *), let forceGestureRecognizer = sender as? SASForceGestureRecognizer else {
            return
        }
        
        updateImageWithTransformation(forceGestureRecognizer.forcePressure)
    }
    
    // MARK:
    // MARK: UIGestureRecognizerDelegate
    
    public func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        // Superview can either by itself or any UITable class
        isTouchingView = touch.view?.superview == self
        
        return true // default value set from framework
    }
}
