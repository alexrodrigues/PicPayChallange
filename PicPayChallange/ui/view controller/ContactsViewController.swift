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
        
    }
    
    func setupViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
}
