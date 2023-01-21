//
//  Info.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 20/01/23.
//

import Foundation

struct Info: Mappable {
    let count: Int
    let pages: Int
    let next: String?
    let previous: String?
}
