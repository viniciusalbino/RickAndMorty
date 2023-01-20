//
//  CharacterModel.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 20/01/23.
//

import Foundation

public struct CharacterModel: Codable, Identifiable {
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
}

public enum Status: String {
   case alive = "alive"
   case dead = "dead"
   case unknown = "unknown"
   case none = ""
}

public enum Gender: String {
   case female = "female"
   case male = "male"
   case genderless = "genderless"
   case unknown = "unknown"
   case none = ""
}
