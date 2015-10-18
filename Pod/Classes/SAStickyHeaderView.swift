//
//  MFStickyHeaderView.swift
//  SA
//
//  Created by shams ahmed on 18/10/2015.
//  Copyright © 2015 Maxfab. All rights reserved.
//

import UIKit

class SAStickyHeaderView: UIView {
    
    let imageView: UIImageView = UIImageView()
    
    internal let containerView = UIView()
    
    internal var heightLayoutConstraint = NSLayoutConstraint()
    internal var bottomLayoutConstraint = NSLayoutConstraint()
    internal var containerLayoutConstraint = NSLayoutConstraint()
    
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
    
    func setup() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .ScaleAspectFill
        containerView.addSubview(imageView)
    }
    
    // MARK:
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[containerView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["containerView" : containerView]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[containerView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["containerView" : containerView]))
        containerLayoutConstraint = NSLayoutConstraint(item: containerView, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 1.0, constant: 0.0)
        addConstraint(containerLayoutConstraint)
        
        containerView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[imageView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["imageView" : imageView]))
        bottomLayoutConstraint = NSLayoutConstraint(item: imageView, attribute: .Bottom, relatedBy: .Equal, toItem: containerView, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        containerView.addConstraint(bottomLayoutConstraint)
        heightLayoutConstraint = NSLayoutConstraint(item: imageView, attribute: .Height, relatedBy: .Equal, toItem: containerView, attribute: .Height, multiplier: 1.0, constant: 0.0)
        containerView.addConstraint(heightLayoutConstraint)
    }    
}
