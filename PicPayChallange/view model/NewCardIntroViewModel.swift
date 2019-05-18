//
//  NewCardIntroViewModel.swift
//  PicPayChallange
//
//  Created by Alex Rodrigues on 08/05/19.
//  Copyright © 2019 Alex Rodrigues. All rights reserved.
//

import UIKit

class NewCardIntroViewModel {

    // MARK: - Variables
    
    private var coordinator: NewCardCoordinator
    
    // MARK: - Initializer
    
    init(with navigationController: UINavigationController?) {
        coordinator = NewCardCoordinator(with: navigationController)
    }
    
    // MARK: Navigation
    
    func navigate() {
        coordinator.navigateToNewCardSignup()
    }
}
