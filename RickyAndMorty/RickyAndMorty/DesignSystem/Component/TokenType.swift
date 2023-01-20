//
//  TokenType.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 20/01/23.
//

import Foundation
enum TokenType: String, Decodable {
    case string
    case unit
    case color
    case number
    case size
}
