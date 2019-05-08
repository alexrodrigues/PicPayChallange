//
//  PicPayCoordinator.swift
//  PicPayChallange
//
//  Created by Alex Rodrigues on 07/05/19.
//  Copyright © 2019 Alex Rodrigues. All rights reserved.
//

import UIKit

class ContactsCoordinator {

    // MARK: - Variables
    
    private var navigationController: UINavigationController
    
    // MARK: - Initializers
    
    init(with navigation: UINavigationController?) {
        guard let nav = navigation else {
            fatalError("No Navigation controller has been found")
        }
        self.navigationController = nav
    }
    
    // MARK: - Navigations
    
    func navigateToNewCardIntro() {
        let newCardController = NewCardIntroViewController.instantiateFromNib()
        navigationController.pushViewController(newCardController, animated: true)
    }
}
