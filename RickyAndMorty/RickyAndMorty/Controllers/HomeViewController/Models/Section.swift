//
//  Section.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 21/01/23.
//

import Foundation

enum Section: Int, CaseIterable {
    case characters
    case locations
    case episodes
    
    var title: String {
        switch self {
        case .characters:
            return "Characters".localized()
        case .locations:
            return "Locations".localized()
        case .episodes:
            return "Episodes".localized()
        }
    }
}
