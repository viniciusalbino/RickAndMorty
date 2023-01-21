//
//  LocationInfo.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 21/01/23.
//

import Foundation

struct LocationsInfo: Codable {
    let info: Info
    let results: [Location]
}
