//
//  SAStickyHeaderView+Gesture.swift
//  SAStickyHeaderExample
//
//  Created by shams ahmed on 18/10/2015.
//  Copyright © 2015 SA. All rights reserved.
//

import UIKit

extension SAStickyHeaderView {
    
    // MARK:
    // MARK: Gesture
    
    internal func didSwipeImageView(sender: UISwipeGestureRecognizer) {
        updateImageWithDirection(sender.direction)
    }
}
