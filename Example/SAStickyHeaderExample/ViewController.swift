//
//  ViewController.swift
//  SAStickyHeaderExample
//
//  Created by shams ahmed on 18/10/2015.
//  Copyright © 2015 SA. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // MARK:
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make Header view
        let header = SAStickyHeaderView(frame: CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 400))
        
        // Images are all from Github
        // Site: https://octodex.github.com/
        header.images.appendContentsOf([UIImage(named: "gracehoppertocat"), UIImage(named: "hipster-partycat"), UIImage(named: "mountietocat"), UIImage(named: "octoliberty"), UIImage(named: "Professortocat_v2")])
        
        tableView.tableHeaderView = header
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK:
    // MARK: Scroll 
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        if let headerView = tableView.tableHeaderView as? SAStickyHeaderView {
            headerView.scrollViewDidScroll(scrollView)
        }
    }
}
