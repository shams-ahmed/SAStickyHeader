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
    
    func updateImageWithDirection(direction: UISwipeGestureRecognizerDirection) {
        // loop for images and swipe them out depending on a match and direction of swipe
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
                if imageView.image == last && images.count > 2 {
                    imageView.image = images[images.count - 2]
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
    
    func didUpdateImages() {
        // add first image to imageView and display it
        if imageView.image == nil, let firstImage = images.first {
            imageView.image = firstImage
        }
    }
}
