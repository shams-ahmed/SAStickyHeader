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
    
    internal func didSwipeImageView(_ sender: UISwipeGestureRecognizer) {
        updateImageWithDirection(sender.direction)
    }
    
    internal func didTapHeaderView(_ sender: UIGestureRecognizer) {
        guard #available(iOS 9, *), let forceGestureRecognizer = sender as? SASForceGestureRecognizer else {
            return
        }
        
        updateImageWithTransformation(forceGestureRecognizer.forcePressure)
    }
    
    // MARK:
    // MARK: UIGestureRecognizerDelegate
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool { 
        return true // default value set from framework
    }
}
