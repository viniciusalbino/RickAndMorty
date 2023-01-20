//
//  TabBarItem.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 20/01/23.
//

import Foundation
import UIKit

enum TabBarItem: Int {
    case home = 0
    case favorites = 1
    
    var title: String {
        switch self {
        case .home:
            return "Home".localized()
        case .favorites:
            return "Favoritos".localized()
        }
    }
    
    var icon: UIImage {
        switch self {
        case .home:
            return UIImage(systemName: "circle.grid.3x3.circle")!
        case .favorites:
            return UIImage(systemName: "star")!
        }
    }
    
    var accessibilityIdentifier: String {
        return self.title.uppercased()
    }
}
