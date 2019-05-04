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
    }
    
    func setupViewHierarchy() {
        addSubview(profileImageView)
    }
    
    func setupConstraints() {
        profileImageView
            .topAnchor(equalTo: topAnchor, constant: 16.0, priority: .required)
            .leadingAnchor(equalTo: leadingAnchor, constant: 16.0, priority: .required)
            .heightAnchor(equalTo:88.0)
                .widthAnchor(equalTo: 88.0)
    }
}
