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
    case Gracehoppertocat
    case Hipster
    case Mountietocat
    case Octoliberty
    case ProfessortocatV2
}

class ViewController: UITableViewController {
    
    // list of github images for example, for DEMO purposes i've loaded everything first but can easily be added afterworld with images.append()
    let images = [UIImage(named: SAGithubImage.Gracehoppertocat.rawValue), UIImage(named: SAGithubImage.Hipster.rawValue), UIImage(named: SAGithubImage.Mountietocat.rawValue), UIImage(named: SAGithubImage.Octoliberty.rawValue), UIImage(named: SAGithubImage.ProfessortocatV2.rawValue)]
    
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
//    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return SAStickyHeaderView(table: tableView, image: images)
//    }
    
    // MARK:
    // MARK: Setup
    
    func setupView() {
        // EXAMPLE 1: SAStickyHeaderView with a frame and optional image array.
        
        tableView.tableHeaderView = SAStickyHeaderView(frame: CGRect(x: 0, y: 0, width: CGRectGetWidth(view.frame), height: 400), table: tableView, image: images)
    }
}
