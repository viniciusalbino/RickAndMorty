//
//  CharacterDetailPresenter.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 22/01/23.
//

import Foundation

final class CharacterDetailPresenter {
    // MARK: -  Viper Properties
    weak var viewController: CharacterDetailPresenterOutputProtocol?
    private let router: CharacterDetailRouterProtocol
    private let interactor: CharacterDetailInteractorInputProtocol
    
    // MARK: - Properties
    private var content: CharacterModel?
    private var isFavorite: Bool = false
    
    // MARK: - init
    init(router: CharacterDetailRouterProtocol, interactor: CharacterDetailInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
    public func setContent(data: CharacterModel) {
        self.content = data
    }
}

// MARK: - Presenter Input Protocol
extension CharacterDetailPresenter: CharacterDetailPresenterInputProtocol {
    func getImageURL() -> String {
        return content?.image ?? ""
    }
    
    func getName() -> String {
        return content?.name ?? ""
    }
    
    func getStatus() -> String {
        if let data = content {
            return "\(data.status) - \(data.species)"
        }
        return ""
    }
    
    func getEpisode() -> String {
        return content?.episode.first ?? ""
    }
    
    func getGender() -> String {
        return content?.gender ?? ""
    }
    
    func checkFavorite() {
        if let data = content {
            interactor.checkFavorite(item: data)
        }
    }
    
    func addFavorite() {
        guard let data = content else {
            return
        }
        if isFavorite {
            interactor.removeFavorite(item: data)
        } else {
            interactor.addFavorite(item: data)
        }
    }
}

// MARK: - Presenter Output Protocol
extension CharacterDetailPresenter: CharacterDetailInteractorOutputProtocol {
    func isFavorite(isFav: Bool) {
        isFavorite = isFav
        viewController?.didCheckedFavorite(isFav: isFavorite)
    }
    
    func addedFavorite() {
        isFavorite = true
        viewController?.didCheckedFavorite(isFav: isFavorite)
    }
    
    func removedFavorite() {
        isFavorite = false
        viewController?.didCheckedFavorite(isFav: isFavorite)
    }
}
