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
    
    init(info: Info, filterApplyed: [String : String]? = nil, results: [CharacterModel]) {
        self.info = info
        self.filterApplyed = filterApplyed
        self.results = results
    }
}
