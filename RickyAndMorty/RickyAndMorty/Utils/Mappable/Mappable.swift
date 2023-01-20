//
//  Mappable.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 19/01/23.
//

import Foundation

public typealias JSONDictionary = [String: Any]

infix operator <-->

public func <--> <T: Codable>(jsonData: Data?, type: T.Type) -> T? {
    guard let data = jsonData, !data.isEmpty else {
        return nil
    }
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return try? decoder.decode(T.self, from: data)
}

public func <--> <T:Codable>(jsonData: Data?, type: [T.Type]) -> [T]? {
    guard let data = jsonData, !data.isEmpty else {
        return nil
    }
    
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return try? decoder.decode([T].self, from: data)
}
