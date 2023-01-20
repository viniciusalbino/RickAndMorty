//
//  DesignTokenObject.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 20/01/23.
//

import Foundation

struct DesignTokenObject: Decodable {
    var properties: [DesignToken]
}

struct DesignToken: Decodable {
    var type: TokenType?
    var category: TokenCategory?
    var name: String
    var value: String
    
    enum CodingKeys: String, CodingKey {
        case type
        case category
        case name
        case value
    }
}
