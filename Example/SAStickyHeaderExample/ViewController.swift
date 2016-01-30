//
//  ViewController.swift
//  SAStickyHeaderExample
//
//  Created by shams ahmed on 18/10/2015.
//  Copyright © 2015 SA. All rights reserved.
//

import UIKit

/**
Github example images from: https://octodex.github.com
*/
enum SAGithubImage: String {
    case Example1 // Gracehoppertocat
    case Example2 // Hipster
    case Example3 // Mountietocat
    case Example4 // Octoliberty
    case Example5 // ProfessortocatV2
}

/// Example View Controller
class ViewController: UITableViewController {
    
    // list of github images for example, for DEMO purposes i've loaded everything first but can easily be added afterworld with images.append()
    let images = [
        UIImage(named: SAGithubImage.Example1.rawValue),
        UIImage(named: SAGithubImage.Example2.rawValue),
        UIImage(named: SAGithubImage.Example3.rawValue),
        UIImage(named: SAGithubImage.Example4.rawValue),
        UIImage(named: SAGithubImage.Example5.rawValue)
    ]
    
    // MARK:
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK:
    // MARK: TableViewDelegate

    // EXAMPLE 2: Using Delegate
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return SAStickyHeaderView(table: tableView, image: images)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("Cell1") else {
            assertionFailure()
            
            return UITableViewCell()
        }
        
        return cell
    }
    
    // MARK:
    // MARK: Setup
    
    func setupView() {
        // EXAMPLE 1: SAStickyHeaderView with a frame and optional image array.
//        tableView.tableHeaderView = SAStickyHeaderView(frame: CGRect(x: 0, y: 0, width: CGRectGetWidth(view.frame), height: 400), table: tableView, image: images)
    }
}
