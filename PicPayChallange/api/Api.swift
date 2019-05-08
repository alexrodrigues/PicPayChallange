//
//  Api.swift
//  PicPayChallange
//
//  Created by Alex Rodrigues on 23/03/19.
//  Copyright © 2019 Alex Rodrigues. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case error(MyError)
}

class Api<T: Decodable> {
    
    // MARK: - Variables

    private let errorMessage = "Something went wrong on fetching data"
    private var remoteTask: URLSessionTask!
    
    // MARK: - Typealias
    
    typealias ApiCompletion = (Result<T>) -> Void
    
    // MARK: - Mehods
    
    func request(with urlString: String, method: ApiDefinitions.Method, completion: @escaping ApiCompletion) {
        guard let url = URL(string: urlString)  else {
            completion(.error(MyError(msg: self.errorMessage)))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest = urlRequest.defaultJsonRequest()
        urlRequest.setHttpMethod(method)
        remoteTask = URLSession.shared.dataTask(with: urlRequest) { data, _ , error in
            guard let dataReceived = data else {
                completion(.error(MyError(msg: self.errorMessage)))
                return
            }
            do {
                let objectResponse = try JSONDecoder().decode(T.self, from: dataReceived)
                completion(.success(objectResponse))
                return
            } catch let error {
                completion(.error(MyError(msg: error.localizedDescription)))
                return
            }
        }
        remoteTask.resume()
    }
}
