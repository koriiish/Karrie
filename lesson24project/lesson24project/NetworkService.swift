//
//  NetworkService.swift
//  lesson24project
//
//  Created by Карина Дьячина on 22.02.24.
//

import Foundation

class NetworkService {
    
    //    static func performGetRequest(url: URL) {
    //        let session = URLSession.shared
    //        let task = session.dataTask(with: url) { (data, response, error) in
    //            if let error = error {
    //                return
    //            }
    //
    //            if let data = data {
    //                do {
    //                    let decoder = JSONDecoder()
    //                    decoder.keyDecodingStrategy = .convertFromSnakeCase
    //                    let response = try decoder.decode(DayFact.self, from: data)
    //                    print(response)
    //
    //                } catch {
    //                    print(error)
    //                }
    //            }
    //            task.resume()
    //        }
    //    }
    
    static func get(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                return
            }
            
        if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let response = try decoder.decode(DayFact.self, from: data)
                    print(response)
                    
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}

