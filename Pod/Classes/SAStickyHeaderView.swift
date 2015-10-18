//
//  SAStickyHeaderView.swift
//  SA
//
//  Created by shams ahmed on 18/10/2015.
//  Copyright © 2015 Maxfab. All rights reserved.
//

import UIKit

class SAStickyHeaderView: UIView {
    
    /// images to add to header view
    var images = [UIImage?]()
    
    let imageView: UIImageView = UIImageView()
    let containerView = UIView()
    
    var heightLayoutConstraint = NSLayoutConstraint()
    var bottomLayoutConstraint = NSLayoutConstraint()
    var containerLayoutConstraint = NSLayoutConstraint()
    
    // MARK:
    // MARK: Nib
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    // MARK:
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    // MARK:
    // MARK: Setup
    
    private func setup() {
        setupView()
        setupConsistent()
        setupGesture()
    }
    
    private func setupView() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .ScaleAspectFill
        containerView.addSubview(imageView)
    }
    
    private func setupConsistent() {
        bottomLayoutConstraint = NSLayoutConstraint(item: imageView, attribute: .Bottom, relatedBy: .Equal, toItem: containerView, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        
        heightLayoutConstraint = NSLayoutConstraint(item: imageView, attribute: .Height, relatedBy: .Equal, toItem: containerView, attribute: .Height, multiplier: 1.0, constant: 0.0)
        
        containerLayoutConstraint = NSLayoutConstraint(item: containerView, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 1.0, constant: 0.0)
    }
    
    private func setupGesture() {
        let action: Selector = "didSwipeImageView:"
        let leftGesture = UISwipeGestureRecognizer(target: self, action: action)
        let rightGesture = UISwipeGestureRecognizer(target: self, action: action)
        
        leftGesture.direction = UISwipeGestureRecognizerDirection.Left
        rightGesture.direction = UISwipeGestureRecognizerDirection.Right
        
        addGestureRecognizer(leftGesture)
        addGestureRecognizer(rightGesture)
    }
    
    // MARK:
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
    
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[containerView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["containerView" : containerView]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[containerView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["containerView" : containerView]))
        
        addConstraint(containerLayoutConstraint)
        
        containerView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[imageView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["imageView" : imageView]))

        containerView.addConstraint(bottomLayoutConstraint)
        containerView.addConstraint(heightLayoutConstraint)
        
        if let firstImage = images.first {
            imageView.image = firstImage
        }
    }
}
