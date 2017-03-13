//
//  SAStickyHeaderView.swift
//  SAStickyHeaderExample
//
//  Created by shams ahmed on 18/10/2015.
//  Copyright © 2015 SA. All rights reserved.
//

import UIKit

/// SAStickyHeaderView - Simple sticky header with multiple image support via swipe gestures
open class SAStickyHeaderView: UIView {
    
    open let imageView: UIImageView = UIImageView()
    
    internal let containerView = UIView()
    
    internal var heightLayoutConstraint = NSLayoutConstraint()
    internal var bottomLayoutConstraint = NSLayoutConstraint()
    internal var containerLayoutConstraint = NSLayoutConstraint()
    
    /// Reference to make this control and easy and lightweight as much as possible
    internal let tableView: UITableView

    /// Listen to touch events to fix scroll issues
    
    
    internal lazy var tapGesture: UITapGestureRecognizer = {  [unowned self] in
        let selector = #selector(didTapHeaderView(_:))
        
        if #available(iOS 9, *) {
            return SASForceGestureRecognizer(target: self, action: selector)
        } else {
            return UITapGestureRecognizer(target: self, action: selector)
        }
    }()
    
    /// Flag to dictate if user has tapped on this view
    internal var isTouchingView: Bool = false
    
    /// images to add to header view
    open var images = [UIImage?]() {
        didSet {
            didUpdateImages()
        }
    }
    
    // MARK:
    // MARK: Nib
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    // MARK:
    // MARK: Init
    
    required public init(frame: CGRect=CGRect.zero, table: UITableView, image: [UIImage?]?) {
        tableView = table
        
        super.init(frame: frame)
        
        setup()
        setupScrollViewObserve(table)
        
        addImages(image)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        tableView = UITableView()
        
        super.init(coder: aDecoder)
        
        setup()
    }
    
    deinit {
        tableView.removeObserver(self, forKeyPath: "contentOffset")
    }
    
    // MARK:
    // MARK: Setup
    
    fileprivate func setup() {
        setupView()
        setupConsistent()
        setupGesture()
    }
    
    fileprivate func setupView() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        containerView.addSubview(imageView)
    }
    
    fileprivate func setupConsistent() {
        bottomLayoutConstraint = NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: containerView, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        
        heightLayoutConstraint = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: containerView, attribute: .height, multiplier: 1.0, constant: 0.0)
        
        containerLayoutConstraint = NSLayoutConstraint(item: containerView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: 0.0)
    }
    
    /**
    add left and right gesture to imageView
    */
    fileprivate func setupGesture() {
        let swipeAction = #selector(SAStickyHeaderView.didSwipeImageView(_:))
        let leftGesture = UISwipeGestureRecognizer(target: self, action: swipeAction)
        let rightGesture = UISwipeGestureRecognizer(target: self, action: swipeAction)
        
        leftGesture.direction = UISwipeGestureRecognizerDirection.left
        rightGesture.direction = UISwipeGestureRecognizerDirection.right
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        
        addGestureRecognizer(leftGesture)
        addGestureRecognizer(rightGesture)
        tableView.addGestureRecognizer(tapGesture)
    }
    
    fileprivate func setupScrollViewObserve(_ table: UITableView) {
        table.addObserver(self, forKeyPath: "contentOffset", options: .new, context: nil)
        
        if #available(iOS 9, *), let gesture = tapGesture as? SASForceGestureRecognizer {
//            gesture.addObserver(self, forKeyPath: "forcePressure", options: .New, context: nil)
            gesture.addObserver(self, forKeyPath: "forcePressure", options: [.new, .old], context: nil)
        }
    }
    
    // MARK:
    // MARK: Image
    
    fileprivate func addImages(_ image: [UIImage?]?) {
        if let image = image as Array? {
            images.append(contentsOf: image)
        }
    }
    
    // MARK:
    // MARK: Layout
    
    open override func layoutSubviews() {
        super.layoutSubviews()
    
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[containerView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["containerView" : containerView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[containerView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["containerView" : containerView]))
        addConstraint(containerLayoutConstraint)
        
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[imageView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["imageView" : imageView]))
        containerView.addConstraint(bottomLayoutConstraint)
        containerView.addConstraint(heightLayoutConstraint)
    }
}
