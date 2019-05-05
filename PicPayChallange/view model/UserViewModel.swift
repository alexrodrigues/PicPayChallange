//
//  UserViewModel.swift
//  PicPayChallange
//
//  Created by Alex Rodrigues on 04/05/19.
//  Copyright © 2019 Alex Rodrigues. All rights reserved.
//

import UIKit

class UserViewModel {

    private var _user: User
    
    var name: String {
        return _user.name ?? ""
    }
    
    var username: String {
        return _user.username ?? ""
    }
    
    var imageUrl: URL? {
        if let urlString = _user.img, let url = URL(string: urlString) {
            return url
        }
        return nil
    }
    
    init(with user: User) {
        self._user = user
    }
}
