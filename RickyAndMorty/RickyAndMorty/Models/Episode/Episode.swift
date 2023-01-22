//
//  Episode.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 21/01/23.
//

import Foundation

struct Episode: Mappable, Identifiable, Hashable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, episode, characters, url, created
        case airDate = "air_date"
    }
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    static func == (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.name == rhs.name
    }
}

extension Episode {
    func dto() -> CustomTextCellDTO {
        return CustomTextCellDTO(title: name, subtitle: episode, description: airDate)
    }
}
