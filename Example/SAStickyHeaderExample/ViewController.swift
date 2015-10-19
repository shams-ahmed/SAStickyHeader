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
        
        // Images are all from Github https://octodex.github.com/
        let images = [UIImage(named: "gracehoppertocat"), UIImage(named: "hipster-partycat"), UIImage(named: "mountietocat"), UIImage(named: "octoliberty"), UIImage(named: "Professortocat_v2")]
        
        tableView.tableHeaderView = SAStickyHeaderView(frame: CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 400), table: tableView, image: images)
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
}
