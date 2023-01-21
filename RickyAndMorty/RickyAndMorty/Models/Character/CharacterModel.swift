//
//  CharacterModel.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 20/01/23.
//

import Foundation

struct CharacterModel: Codable, Identifiable, Hashable {
    public let id: Int
    public let name: String
    public let status: String
    public let species: String
    public let type: String
    public let gender: String
    public let origin: CharacterOrigin
    public let location: CharacterLocation
    public let image: String
    public let episode: [String]
    public let url: String
    public let created: String
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    static func == (lhs: CharacterModel, rhs: CharacterModel) -> Bool {
        return lhs.name == rhs.name
    }
}

enum Status: String {
   case alive = "alive"
   case dead = "dead"
   case unknown = "unknown"
   case none = ""
}

enum Gender: String {
   case female = "female"
   case male = "male"
   case genderless = "genderless"
   case unknown = "unknown"
   case none = ""
}
