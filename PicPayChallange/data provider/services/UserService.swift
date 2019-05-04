//
//  UserService.swift
//  PicPayChallange
//
//  Created by Alex Rodrigues on 04/05/19.
//  Copyright © 2019 Alex Rodrigues. All rights reserved.
//

import UIKit
import RxSwift

class UserService: PicPayService {
    
    // MARK: - Variables
    
    // MARK: - Mehods
    
    func fetch() -> Observable<[UserViewModel]> {
        let url = fabricateUrl(with: .users)
        return Api<[User]>().request(with: url, method: .get)
                    .map { UserFactory().factor(this: $0) }
    }
}
