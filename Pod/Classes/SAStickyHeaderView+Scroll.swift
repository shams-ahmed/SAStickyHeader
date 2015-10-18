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

    func scrollViewDidScroll(scrollView: UIScrollView) {
        let insert = scrollView.contentInset
        let offsetY = -(scrollView.contentOffset.y + insert.top)
        
        containerLayoutConstraint.constant = insert.top
        
        containerView.clipsToBounds = offsetY <= 0

        bottomLayoutConstraint.constant = offsetY >= 0 ? 0 : -offsetY / 2
        heightLayoutConstraint.constant = max(offsetY + insert.top, insert.top)
    }
}
