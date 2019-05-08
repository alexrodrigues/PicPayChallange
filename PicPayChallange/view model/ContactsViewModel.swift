//
//  ContactsViewModel.swift
//  PicPayChallange
//
//  Created by Alex Rodrigues on 04/05/19.
//  Copyright © 2019 Alex Rodrigues. All rights reserved.
//

import UIKit

class ContactsViewModel {
    
    // MARK: - Variables
    
    var contacts: [UserViewModel]
    private var userService: UserService
    
    // MARK: - Typealias
    
    typealias ContactViewModelCompletion = (_ success: Bool, _ errorMessage: String) -> Void
    
    // MARK: - Initializer
    
    init() {
        contacts = [UserViewModel]()
        userService = UserService()
    }
    
    // MARK: - Methods to query
    
    func fetch(completion: @escaping ContactViewModelCompletion) {
        userService.fetch { [weak self] viewModels, errorMessage in
            guard let self = self else { return }
            if errorMessage.isNotEmpty() {
                completion(false, errorMessage)
            } else {
                self.contacts = viewModels
                completion(true, "")
            }
        }
    }
    
    func filter(basedOn text: String) -> [UserViewModel] {
        return contacts.filter { $0.name.contains(text) }
    }
}
