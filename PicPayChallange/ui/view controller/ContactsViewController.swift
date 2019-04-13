//
//  ContactsViewController.swift
//  PicPayChallange
//
//  Created by Alex Rodrigues on 13/04/19.
//  Copyright © 2019 Alex Rodrigues. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController, ViewConfiguration {
    
    // MARK: - Variables
    
    private var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.searchBar.placeholder = "Search Contacts"
        return controller
    }()
    
    // MARK: - Outlets
    
    // MARK: - Actions
    
    // MARK: - Life Cycle
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    // MARK: - View Coding
    
    func configureViews() {
        self.view.backgroundColor = .black
        navigationItem.hidesSearchBarWhenScrolling = true
        navigationItem.searchController = searchController
    }
    
    func setupViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
}
