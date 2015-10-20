//
//  SAStickyHeaderView+Observe.swift
//  SAStickyHeaderExample
//
//  Created by shams ahmed on 19/10/2015.
//  Copyright © 2015 SA. All rights reserved.
//

import UIKit

public extension SAStickyHeaderView {
    
    // MARK:
    // MARK: KVO
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if let tableView = object as? UITableView {
            updateImageViewFromScrollEvent(tableView)
        }
    }
}
