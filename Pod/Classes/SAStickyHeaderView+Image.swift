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
    // MARK: UI Image
    
    func updateImageWithDirection(direction: UISwipeGestureRecognizerDirection) {
        var animateImage: UIImage?
        
        // loop for images and swipe them out depending on a match and direction of swipe
        for (index, element) in images.enumerate() {
            guard let first = images.first, let last = images.last else {
                assertionFailure("SAStickyHeaderView: No images have been set!")
                
                return
            }
        
            if direction == .Left {
                if imageView.image == last {
                    animateImage = first
                    break
                } else if imageView.image == first {
                    animateImage = images[1]
                    break
                } else if imageView.image == element, let image = images[index+1] {
                    animateImage = image
                    break
                }
            } else if direction == .Right {
                if imageView.image == last && images.count > 2 {
                    animateImage = images[images.count - 2]
                    break
                } else if imageView.image == first {
                    animateImage = last
                    break
                } else if imageView.image == element, let image = images[index-1] {
                    animateImage = image
                    break
                }
            }
        }
        
        // animate image
        UIView.transitionWithView(imageView, duration:0.4, options:.TransitionCrossDissolve, animations: {
            self.imageView.image = animateImage
            self.imageView.transform = CGAffineTransformIdentity
        }, completion: nil)
    }
    
    internal func updateImageWithTransformation(pressure: CGFloat) {
        let pressure = max(1, pressure)
        
        imageView.transform = CGAffineTransformMakeScale(pressure, pressure)
    }
    
    // MARK:
    // MARK: Images
    
    /// set first image whenever new images are added
    internal func didUpdateImages() {
        // add first image to imageView and display it
        if imageView.image == nil, let firstImage = images.first {
            imageView.image = firstImage
            imageView.transform = CGAffineTransformIdentity
        }
    }
}
