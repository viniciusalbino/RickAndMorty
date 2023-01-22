//
//  HomeControllerPresenter.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 21/01/23.
//

import Foundation
import UIKit

final class HomePresenter {
    
    // MARK: -  Viper Properties
    weak var viewController: HomePresenterOutputProtocol?
    private let router: HomeRouterProtocol
    private let interactor: HomeInteractorInputProtocol
    
    // MARK: - Properties
    var allSections = [Section]()
    
    var characters = [CharacterModel]()
    var locations = [Location]()
    var episodes = [Episode]()
    
    // MARK: - init
    init(router: HomeRouterProtocol, interactor: HomeInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

// MARK: - Presenter Input Protocol
extension HomePresenter: HomePresenterInputProtocol {
    func loadContent() {
        Task.init {
            characters = await self.interactor.getCharacters()?.results ?? []
            locations = await self.interactor.getLocations()?.results ?? []
            episodes = await self.interactor.getEpisodes()?.results ?? []
            
            var currentSnapshot = NSDiffableDataSourceSnapshot<Section, AnyHashable>()
            currentSnapshot.appendSections(Section.allCases)
            currentSnapshot.appendItems(characters, toSection: Section.characters)
            currentSnapshot.appendItems(locations, toSection: Section.locations)
            currentSnapshot.appendItems(episodes, toSection: Section.episodes)
            
            viewController?.handle(payload: currentSnapshot)
        }
    }
}

// MARK: - Presenter Output Protocol
extension HomePresenter: HomeInteractorOutputProtocol {
    
}
