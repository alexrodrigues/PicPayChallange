//
//  UserService.swift
//  PicPayChallange
//
//  Created by Alex Rodrigues on 04/05/19.
//  Copyright © 2019 Alex Rodrigues. All rights reserved.
//

import UIKit

class UserService: PicPayService {
    
    // MARK: - Variables
    
    // MARK: - Typealias
    
    typealias UserServiceCompletion = (_ users: [UserViewModel], _ errorMessage: String) -> Void
    
    // MARK: - Mehods
    
    func fetch(_ api:Api<[User]?> = Api<[User]?>(), completion: @escaping UserServiceCompletion) {
        let url = fabricateUrl(with: .users)
        api.request(with: url, method: ApiDefinitions.Method.get) { result -> Void in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    completion(UserFactory().factor(this: response), "")
                }
            case .error(let error):
                DispatchQueue.main.async {
                    completion([UserViewModel](), error.localizedDescription)
                }
            }
        }
    }
}
