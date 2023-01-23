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
    public var content: CharacterModel?
    
    // MARK: - init
    init(router: CharacterDetailRouterProtocol, interactor: CharacterDetailInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
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
}

// MARK: - Presenter Output Protocol
extension CharacterDetailPresenter: CharacterDetailInteractorOutputProtocol {
    
}
