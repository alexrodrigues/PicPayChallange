//
//  NSURL+Extensions.swift
//  PicPayChallange
//
//  Created by Alex Rodrigues on 04/05/19.
//  Copyright © 2019 Alex Rodrigues. All rights reserved.
//

import UIKit

extension URLRequest {
    
    mutating func setHttpMethod(_ method: ApiDefinitions.Method) {
        switch method {
        case .get:
            self.httpMethod = "GET"
        case .post:
            self.httpMethod = "POST"
        }
    }
    
    mutating func defaultJsonRequest() -> URLRequest {
        self.addValue("application/json", forHTTPHeaderField: "Content-Type")
        self.addValue("application/json", forHTTPHeaderField: "Accept")
        return self
    }
}
