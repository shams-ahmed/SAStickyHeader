//
//  SAStickyHeaderView.swift
//  SA
//
//  Created by shams ahmed on 18/10/2015.
//  Copyright © 2015 Maxfab. All rights reserved.
//

import UIKit

/// SAStickyHeaderView - Simple sticky header with multiple image support via swipe gestures
public class SAStickyHeaderView: UIView {
    
    internal let imageView: UIImageView = UIImageView()
    internal let containerView = UIView()
    
    internal var heightLayoutConstraint = NSLayoutConstraint()
    internal var bottomLayoutConstraint = NSLayoutConstraint()
    internal var containerLayoutConstraint = NSLayoutConstraint()
    
    /// images to add to header view
    public var images = [UIImage?]() {
        // As of Swift 2.0, there is still no support for KVO, so to workaround this issue i observer when it set
        didSet {
            didUpdateImages()
        }
    }
    
    // MARK:
    // MARK: Nib
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    // MARK:
    // MARK: Init
    
    public init(frame: CGRect, table: UITableView, image: [UIImage?]?) {
        super.init(frame: frame)
        
        setup()
        setupScrollViewObserve(table)
        addImages(image)
    }
    
    public required init?(coder aDecoder: NSCoder) {
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
    
    /**
    add left and right gesture to imageView
    */
    private func setupGesture() {
        let action: Selector = "didSwipeImageView:"
        let leftGesture = UISwipeGestureRecognizer(target: self, action: action)
        let rightGesture = UISwipeGestureRecognizer(target: self, action: action)
        
        leftGesture.direction = UISwipeGestureRecognizerDirection.Left
        rightGesture.direction = UISwipeGestureRecognizerDirection.Right
        
        addGestureRecognizer(leftGesture)
        addGestureRecognizer(rightGesture)
    }
    
    private func setupScrollViewObserve(table: UITableView) {
        table.addObserver(self, forKeyPath: "contentOffset", options: NSKeyValueObservingOptions.New, context: nil)
    }
    
    // MARK:
    // MARK: Image
    
    private func addImages(image: [UIImage?]?) {
        if let image = image as Array? {
            images.appendContentsOf(image)
        }
    }
    
    // MARK:
    // MARK: Layout
    
    public override func layoutSubviews() {
        super.layoutSubviews()
    
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[containerView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["containerView" : containerView]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[containerView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["containerView" : containerView]))
        
        addConstraint(containerLayoutConstraint)
        
        containerView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[imageView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["imageView" : imageView]))

        containerView.addConstraint(bottomLayoutConstraint)
        containerView.addConstraint(heightLayoutConstraint)
    }
}
