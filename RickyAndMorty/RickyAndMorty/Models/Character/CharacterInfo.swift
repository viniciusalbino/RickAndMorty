//
//  CharacterInfoModel.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 20/01/23.
//

import Foundation

struct CharacterInfo: Codable {
    let info: Info
    var filterApplyed: [String: String]?
    let results: [CharacterModel]
}
