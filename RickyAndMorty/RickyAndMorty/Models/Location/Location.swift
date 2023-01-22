//
//  Location.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 21/01/23.
//

import Foundation

struct Location: Mappable, Identifiable, Hashable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.name == rhs.name
    }
}

extension Location {
    func dto() -> CustomTextCellDTO {
        return CustomTextCellDTO(title: name, subtitle: type, description: dimension)
    }
}
