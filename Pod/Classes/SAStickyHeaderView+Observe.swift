//
//  SAStickyHeaderView+Observe.swift
//  SAStickyHeaderExample
//
//  Created by shams ahmed on 19/10/2015.
//  Copyright © 2015 SA. All rights reserved.
//

import UIKit

extension SAStickyHeaderView {
    
    // MARK:
    // MARK: KVO
    
    override open func observeValue(forKeyPath keyPath: String?,
        of object: Any?,
        change: [NSKeyValueChangeKey : Any]?,
        context: UnsafeMutableRawPointer?) {
        if let tableView = object as? UITableView {
            updateImageViewFromScrollEvent(tableView)
        } else if let gesture = object as? SASForceGestureRecognizer {
            updateImageWithTransformation(gesture.forcePressure)
        }
    }
}
