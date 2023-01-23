//
//  CharacterDetailInteractor.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 22/01/23.
//

import Foundation

final class CharacterDetailInteractor {
    // MARK: - Viper properties
    weak var output: CharacterDetailInteractorOutputProtocol?
    
    private var persister = FavoritesPersister()
}

// MARK: - Input Protocol

extension CharacterDetailInteractor: CharacterDetailInteractorInputProtocol {
    func checkFavorite(item: CharacterModel) {
        output?.isFavorite(isFav: persister.checkFavorite(item: item))
    }
    
    func addFavorite(item: CharacterModel) {
        persister.addFavorite(item: item)
        output?.addedFavorite()
    }
    
    func removeFavorite(item: CharacterModel) {
        _ = persister.deleteFavorite(item: item)
        output?.removedFavorite()
    }
}
