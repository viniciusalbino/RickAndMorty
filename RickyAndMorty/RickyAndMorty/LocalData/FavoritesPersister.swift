//
//  FavoritesPersister.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 23/01/23.
//

import Foundation
import UIKit

final class FavoritesPersister {
    
    func addFavorite(item: CharacterModel) {
        var allFavorites = getFavorites()
        allFavorites.append(item)
        UserDefaultsManager.shared.set(allFavorites, forKey: .favorites)
    }
    
    func getFavorites() -> [CharacterModel] {
        return UserDefaultsManager.shared.get(objectForkey: .favorites, type: [CharacterModel].self) ?? []
    }
    
    func deleteFavorite(item: CharacterModel) -> Bool {
        var allFavorites = getFavorites()
        if let fav = allFavorites.firstIndex(where: { $0.id == item.id }) {
            allFavorites.remove(at: fav)
            UserDefaultsManager.shared.set(allFavorites, forKey: .favorites)
            return true
        }
        return false
    }
    
    func checkFavorite(item: CharacterModel) -> Bool {
        let allFavorites = getFavorites()
        if let _ = allFavorites.firstIndex(where: { $0.id == item.id }) {
            return true
        }
        return false
    }
}
