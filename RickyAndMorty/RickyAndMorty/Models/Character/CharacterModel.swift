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
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: CharacterOrigin
    let location: CharacterLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
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

extension CharacterModel {
    func dto() -> CharacterCellDTO {
        return CharacterCellDTO(title: name, subtitle: "Status: \(status)", description: "Species: \(species)", iconURL: image)
        
    }
}
