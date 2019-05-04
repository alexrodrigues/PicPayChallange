//
//  ContactsViewController.swift
//  PicPayChallange
//
//  Created by Alex Rodrigues on 13/04/19.
//  Copyright © 2019 Alex Rodrigues. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ContactsViewController: UIViewController, ViewConfiguration {
    
    // MARK: - Variables
    
    private lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.searchBar.placeholder = "Search Contacts"
        return controller
    }()
    
    private lazy var contactsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    private var contactViewModel: ContactsViewModel!
    private var disposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        contactViewModel = ContactsViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        setupViews()
        contactViewModel.fetch()
    }
    
    // MARK: - ViewModel Binding
    
    func bind() {
        contactViewModel.contacts
                .observeOn(MainScheduler.instance)
            .subscribe(onNext: { viewModels in
                if viewModels.isEmpty { return }
                print(viewModels.debugDescription)
            }).disposed(by: disposeBag)
        
        contactViewModel.errorMessage
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { message in
                if (message.isEmpty) { return }
                print(message)
            }).disposed(by: disposeBag)
    }
    
    // MARK: - View Coding
    
    func configureViews() {
        self.view.backgroundColor = .black
        navigationItem.hidesSearchBarWhenScrolling = true
        navigationItem.searchController = searchController
    }
    
    func setupViewHierarchy() {
        view.addSubview(contactsTableView)
    }
    
    func setupConstraints() {
        contactsTableView
            .topAnchor(equalTo: view.topAnchor)
            .bottomAnchor(equalTo: view.bottomAnchor)
            .leadingAnchor(equalTo: view.leadingAnchor)
            .trailingAnchor(equalTo: view.trailingAnchor)
    }
}
