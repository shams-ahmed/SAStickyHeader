//
//  SASForceGestureRecognizer.swift
//  SAStickyHeaderExample
//
//  Created by shams ahmed on 31/01/2016.
//  Copyright © 2016 SA. All rights reserved.
//

import UIKit.UIGestureRecognizerSubclass

/// Custom gesture which store force values
internal class SASForceGestureRecognizer: UITapGestureRecognizer {
    
    /// Measurement of the force pressure value
    internal dynamic var forcePressure: CGFloat = 0
    
    // MARK:
    // MARK: Override
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        
        updateForce(touches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        
        updateForce(touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        
        updateForce(touches)
    }
    
    // MARK:
    // MARK: Force
    
    internal func updateForce(_ touches: Set<UITouch>) {
        if #available(iOS 9.0, *) {
            forcePressure ?= touches.first?.force
        }
    }
}
