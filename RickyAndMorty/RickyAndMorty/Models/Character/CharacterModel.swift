//
//  CharacterModel.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 20/01/23.
//

import Foundation

struct CharacterModel: Mappable, Identifiable, Hashable {
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
    
    func toData() -> Data? {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self) {
            return encoded
        }
        return nil
    }
}

enum Status: String, Mappable {
   case alive = "alive"
   case dead = "dead"
   case unknown = "unknown"
   case none = ""
}

enum Gender: String, Mappable {
   case female = "female"
   case male = "male"
   case genderless = "genderless"
   case unknown = "unknown"
   case none = ""
}

struct CharacterCellDTO {
    var title: String
    var subtitle: String
    var description: String
    var iconURL: String?
}

extension CharacterModel {
    func dto() -> CharacterCellDTO {
        return CharacterCellDTO(title: name, subtitle: "Status: \(status)", description: "Species: \(species)", iconURL: image)
    }
}
