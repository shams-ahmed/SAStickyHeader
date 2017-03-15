//
//  SAStickyHeaderView+Scroll.swift
//  SA
//
//  Created by shams ahmed on 18/10/2015.
//
//

import UIKit

extension SAStickyHeaderView {

    // MARK:
    // MARK: Scroll

    /// Update header view from a drag movement
    internal func updateImageViewFromScrollEvent(_ tableView: UITableView) {
        let insert = tableView.contentInset
        let offset = -(tableView.contentOffset.y + insert.top)
        
        containerLayoutConstraint.constant = insert.top
        
        containerView.clipsToBounds = offset <= 0

        bottomLayoutConstraint.constant = offset >= 0 ? 0 : -offset / 2
        heightLayoutConstraint.constant = max(offset + insert.top, insert.top)
    }
}
