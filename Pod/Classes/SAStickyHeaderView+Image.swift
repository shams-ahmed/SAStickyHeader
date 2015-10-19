//
//  SAStickyHeaderView+Image.swift
//  SAStickyHeaderExample
//
//  Created by shams ahmed on 18/10/2015.
//  Copyright © 2015 SA. All rights reserved.
//

import UIKit

extension SAStickyHeaderView {
 
    // MARK:
    // MARK: Image
    
    func updateImageWithDirction(direction: UISwipeGestureRecognizerDirection) {
        for (index, element) in images.enumerate() {
            guard let first = images.first, let last = images.last else {
                return
            }
            
            if direction == UISwipeGestureRecognizerDirection.Left {
                if imageView.image == last {
                    imageView.image = first
                    break
                } else if imageView.image == first {
                    imageView.image = images[1]
                    break
                } else if imageView.image == element, let image = images[index+1] {
                    imageView.image = image
                    break
                }
            } else if direction == UISwipeGestureRecognizerDirection.Right {
                if imageView.image == last {
                    imageView.image = images[images.count-2]
                    break
                } else if imageView.image == first {
                    imageView.image = last
                    break
                } else if imageView.image == element, let image = images[index-1] {
                    imageView.image = image
                    break
                }
            }
        }
    }
}
