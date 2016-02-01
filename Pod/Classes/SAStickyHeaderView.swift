//
//  SAStickyHeaderView.swift
//  SAStickyHeaderExample
//
//  Created by shams ahmed on 18/10/2015.
//  Copyright © 2015 SA. All rights reserved.
//

import UIKit

/// SAStickyHeaderView - Simple sticky header with multiple image support via swipe gestures
public class SAStickyHeaderView: UIView {
    
//    public let imageView: UIImageView = UIImageView()
    public let imageView: UIImageView = UIImageView(image: UIImage(named: SAGithubImage.Example1.rawValue))
    
    internal let containerView = UIView()
    
    internal var heightLayoutConstraint = NSLayoutConstraint()
    internal var bottomLayoutConstraint = NSLayoutConstraint()
    internal var containerLayoutConstraint = NSLayoutConstraint()
    
    /// Reference to make this control and easy and lightweight as much as possible
    internal let tableView: UITableView

    /// Listen to touch events to fix scroll issues
    
    
    internal lazy var tapGesture: UITapGestureRecognizer = {  [unowned self] in
        let selector: Selector = "didTapHeaderView:"
        
        if #available(iOS 9, *) {
            return SASForceGestureRecognizer(target: self, action: selector)
        } else {
            return UITapGestureRecognizer(target: self, action: selector)
        }
    }()
    
    /// Flag to dictate if user has tapped on this view
    internal var isTouchingView: Bool = false
    
    /// images to add to header view
    public var images = [UIImage?]() {
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
    
    required public init(frame: CGRect=CGRectZero, table: UITableView, image: [UIImage?]?) {
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
        let swipeAction: Selector = "didSwipeImageView:"
        let leftGesture = UISwipeGestureRecognizer(target: self, action: swipeAction)
        let rightGesture = UISwipeGestureRecognizer(target: self, action: swipeAction)
        
        leftGesture.direction = UISwipeGestureRecognizerDirection.Left
        rightGesture.direction = UISwipeGestureRecognizerDirection.Right
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        
        addGestureRecognizer(leftGesture)
        addGestureRecognizer(rightGesture)
        tableView.addGestureRecognizer(tapGesture)
    }
    
    private func setupScrollViewObserve(table: UITableView) {
        table.addObserver(self, forKeyPath: "contentOffset", options: .New, context: nil)
        
        if #available(iOS 9, *), let gesture = tapGesture as? SASForceGestureRecognizer {
//            gesture.addObserver(self, forKeyPath: "forcePressure", options: .New, context: nil)
            gesture.addObserver(self, forKeyPath: "forcePressure", options: [.New, .Old], context: nil)
        }
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
