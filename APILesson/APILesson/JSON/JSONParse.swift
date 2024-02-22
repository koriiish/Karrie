//
//  JSONParse.swift
//  Spotify
//
//  Created by berdy on 28.12.23.
//

import Foundation

enum ParseError: Error {
    case fileNotFound
    case convertDataFromJSON
}

final class LocalJSONParser {
    static func readLocalJSONFile(forName name: String) throws -> Data {
        guard let filePath = Bundle.main.path(forResource: name, ofType: "json")  else {
            throw ParseError.fileNotFound
        }
        let fileURL = URL(fileURLWithPath: filePath)
        do {
            return try Data(contentsOf: fileURL)
        } catch {
            throw ParseError.convertDataFromJSON
        }
    }
    
    static func parse(jsonData: Data) -> [Track]? {
        do {
            let decodedData = try JSONDecoder().decode([Track].self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}
