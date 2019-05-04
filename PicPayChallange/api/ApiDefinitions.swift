//
//  ApiDefinitions.swift
//  PicPayChallange
//
//  Created by Alex Rodrigues on 26/03/19.
//  Copyright © 2019 Alex Rodrigues. All rights reserved.
//

import Foundation

struct ApiDefinitions {
    static let baseUrl = "http://careers.picpay.com/tests/mobdev/"
    
    enum Endpoint: String {
        case users
    }
    
    enum Method: String {
        case get = "GET"
        case post = "POST"
    }
}
