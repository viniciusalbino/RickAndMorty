//
//  CharacterDetailProtocols.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 22/01/23.
//

import Foundation

// MARK: - ViewController
protocol CharacterDetailPresenterOutputProtocol: AnyObject {
    func didCheckedFavorite(isFav: Bool)
}

// MARK: - Presenter
protocol CharacterDetailPresenterInputProtocol: AnyObject {
    func getImageURL() -> String
    func getName() -> String
    func getStatus() -> String
    func getEpisode() -> String
    func getGender() -> String
    func checkFavorite()
    func addFavorite()
}

// MARK: - Interactor
protocol CharacterDetailInteractorInputProtocol: AnyObject {
    func checkFavorite(item: CharacterModel)
    func addFavorite(item: CharacterModel)
    func removeFavorite(item: CharacterModel)
}

protocol CharacterDetailInteractorOutputProtocol: AnyObject {
    func isFavorite(isFav: Bool)
    func addedFavorite()
    func removedFavorite()
}

// MARK: - Router
protocol CharacterDetailRouterProtocol: AnyObject {
    
}
