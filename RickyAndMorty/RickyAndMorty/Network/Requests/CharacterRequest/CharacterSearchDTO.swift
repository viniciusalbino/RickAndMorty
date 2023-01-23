//
//  CharacterSearchDTO.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 22/01/23.
//

import Foundation

struct CharacterSearchDTO {
    var name: String
    
    func dto() -> [String: String] {
        return ["name": name]
    }
}
