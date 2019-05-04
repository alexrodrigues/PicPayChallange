//
//  PicPayService.swift
//  PicPayChallange
//
//  Created by Alex Rodrigues on 04/05/19.
//  Copyright © 2019 Alex Rodrigues. All rights reserved.
//

import UIKit

class PicPayService {
    
    // MARK: - Variables
    
    // MARK: - Mehods

    func fabricateUrl(with endpoint: ApiDefinitions.Endpoint) -> String {
        return "\(ApiDefinitions.baseUrl)\(endpoint)"
    }
}
