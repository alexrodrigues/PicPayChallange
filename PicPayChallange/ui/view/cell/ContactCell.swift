//
//  ContactCell.swift
//  PicPayChallange
//
//  Created by Alex Rodrigues on 04/05/19.
//  Copyright © 2019 Alex Rodrigues. All rights reserved.
//

import UIKit
import Kingfisher

class ContactCell: UITableViewCell, ViewConfiguration {
    
    // MARK: - View Variables
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Variables
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Setup
    
    func setup(using userViewModel: UserViewModel) {
        
        nameLabel.text = userViewModel.name
        usernameLabel.text = userViewModel.username
        
        if let url = userViewModel.imageUrl {
            profileImageView.kf.indicatorType = .activity
            profileImageView.kf.setImage(with: url)
        } else {
            profileImageView.backgroundColor = .darkGray
        }
    }
}

// MARK: - View Coding
extension ContactCell {
    func configureViews() {
        backgroundColor = .clear
        
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = 44.0
        
        usernameLabel.textColor = .white
        usernameLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .black)
        
        nameLabel.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.85)
        nameLabel.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        
        labelsStackView.alignment = .leading
        labelsStackView.distribution = .fillProportionally
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 8.0
    }
    
    func setupViewHierarchy() {
        addSubview(profileImageView)
        
        labelsStackView.addArrangedSubview(usernameLabel)
        labelsStackView.addArrangedSubview(nameLabel)
        
        addSubview(labelsStackView)
    }
    
    func setupConstraints() {
        profileImageView
            .topAnchor(equalTo: topAnchor, constant: 16.0, priority: .required)
            .leadingAnchor(equalTo: leadingAnchor, constant: 16.0, priority: .required)
            .heightAnchor(equalTo:88.0)
                .widthAnchor(equalTo: 88.0)
        
        labelsStackView
                .topAnchor(equalTo: profileImageView.topAnchor, constant: 16.0, priority: .required)
                .leadingAnchor(equalTo: profileImageView.trailingAnchor, constant: 16.0, priority: .required)
                .trailingAnchor(equalTo: trailingAnchor)
    }
}
