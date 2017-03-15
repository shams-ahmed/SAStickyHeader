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
enum GithubImage: String {
    case example1 = "Example1" // Gracehoppertocat
    case example2 = "Example2" // Hipster
    case example3 = "Example3" // Mountietocat
    case example4 = "Example4" // Octoliberty
    case example5 = "Example5" // ProfessortocatV2
}

/// Example View Controller
class ViewController: UITableViewController {
    
    // list of github images, for Demo purposes i've loaded everything first but can easily be inserted with 'images.append()'
    private let images = [
        UIImage(named: GithubImage.example1.rawValue),
        UIImage(named: GithubImage.example2.rawValue),
        UIImage(named: GithubImage.example3.rawValue),
        UIImage(named: GithubImage.example4.rawValue),
        UIImage(named: GithubImage.example5.rawValue)
    ]
    
    // MARK:
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    // MARK:
    // MARK: TableViewDelegate

    // EXAMPLE 2: Using Delegate
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return SAStickyHeaderView(table: tableView, with: images)
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Cell1"
        
        return tableView.dequeueReusableCell(withIdentifier: identifier)
            ?? UITableViewCell(style: .default, reuseIdentifier: identifier)
    }
    
    // MARK:
    // MARK: Setup
    
    func setupView() {
        // EXAMPLE 1: SAStickyHeaderView with a frame and optional image array.
        let stickyHeaderView = SAStickyHeaderView(CGRect(x: 0, y: 0, width: view.frame.width, height: 400),
                                      table: tableView,
                                      with: images
        )
        
        tableView.tableHeaderView = stickyHeaderView
    }
}
