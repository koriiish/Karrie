//
//  NetworkManager.swift
//  APILesson
//
//  Created by berdy on 22.02.24.
//

import Foundation

class NetworkManager {

    static func performGetRequest(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
    }
    
    static func performPostRequest(url: URL, data: Data, completion: @escaping (Result<Data, Error>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
    }
}
