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
    
    // MARK: - View Variables
    
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
    
    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    // MARK: - Variables
    
    private var contactViewModel: ContactsViewModel!
    private var disposeBag = DisposeBag()
    private let contactCellIdentifier = "ContactCell"
    
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
        registerCells()
        contactViewModel.fetch()
    }
    
    private func registerCells() {
        contactsTableView.register(ContactCell.self, forCellReuseIdentifier: contactCellIdentifier)
    }
    
    // MARK: - ViewModel Binding
    
    func bind() {
        contactViewModel.contacts
                .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.presentContacts()
            }).disposed(by: disposeBag)
        
        contactViewModel.errorMessage
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { message in
                if (message.isEmpty) { return }
                print(message)
            }).disposed(by: disposeBag)
    }
    
    // MARK: - Presentation methods
    
    private func presentContacts() {
        contactsTableView.reloadData()
        activityIndicatorView.stopAnimating()
        contactsTableView.isHidden = false
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension ContactsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactViewModel.contacts.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: contactCellIdentifier, for: indexPath) as? ContactCell else { return UITableViewCell() }
        let viewModel = contactViewModel.contacts.value[indexPath.row]
        cell.setup(using: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
}

// MARK: - View Coding

extension ContactsViewController {
    func configureViews() {
        self.view.backgroundColor = .black
        navigationItem.hidesSearchBarWhenScrolling = true
        navigationItem.searchController = searchController
        
        contactsTableView.isHidden = true
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
    }
    
    func setupViewHierarchy() {
        view.addSubview(contactsTableView)
        view.addSubview(activityIndicatorView)
    }
    
    func setupConstraints() {
        contactsTableView
            .topAnchor(equalTo: view.topAnchor)
            .bottomAnchor(equalTo: view.bottomAnchor)
            .leadingAnchor(equalTo: view.leadingAnchor)
            .trailingAnchor(equalTo: view.trailingAnchor)
        
        activityIndicatorView
                .centerXAnchor(equalTo: view.centerXAnchor)
                .centerYAnchor(equalTo: view.centerYAnchor)
    }
}
