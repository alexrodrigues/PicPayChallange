//
//  UserFactory.swift
//  PicPayChallange
//
//  Created by Alex Rodrigues on 04/05/19.
//  Copyright © 2019 Alex Rodrigues. All rights reserved.
//

import UIKit

class UserFactory {
    
    // MARK: - Variables
    
    // MARK: - Mehods
    
    func factor(this users: [User]?) -> [UserViewModel] {
        guard let noNilUsers = users else { return [UserViewModel]() }
        return noNilUsers.map { UserViewModel(with: $0) }
    }
}
