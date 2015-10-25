//
//  ViewController.swift
//  SAStickyHeaderExample
//
//  Created by shams ahmed on 18/10/2015.
//  Copyright © 2015 SA. All rights reserved.
//

import UIKit

/**
Github Example images from: https://octodex.github.com/
*/
enum SASGithubImage: String {
    case gracehoppertocat
    case hipsterPartycat
    case mountietocat
    case octoliberty
    case Professortocat_v2
}

class ViewController: UITableViewController {
    
    // MARK:
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // list of github images for example, for DEMO purposes ive loadded everything first but this can easiler be added afterworld with images.append()
        let images = [UIImage(named: SASGithubImage.gracehoppertocat.rawValue), UIImage(named: SASGithubImage.hipsterPartycat.rawValue), UIImage(named: SASGithubImage.mountietocat.rawValue), UIImage(named: SASGithubImage.octoliberty.rawValue), UIImage(named: SASGithubImage.Professortocat_v2.rawValue)]
        
        // add SAStickyHeaderView with a frame and optional image array. 
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
