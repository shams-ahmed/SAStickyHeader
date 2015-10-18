//
//  MFStickyHeaderView+Scroll.swift
//  Pods
//
//  Created by shams ahmed on 18/10/2015.
//
//

import UIKit

extension SAStickyHeaderView {

    // MARK:
    // MARK: Scroll

    func scrollViewDidScroll(scrollView: UIScrollView) {
        containerLayoutConstraint.constant = scrollView.contentInset.top;
        
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top);
        containerView.clipsToBounds = offsetY <= 0
        bottomLayoutConstraint.constant = offsetY >= 0 ? 0 : -offsetY / 2
        heightLayoutConstraint.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
    }
}
