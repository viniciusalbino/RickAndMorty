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
    
    func loadSectionController(section: Section) {
        switch section {
        case .characters:
            router.loadCharactersController()
        case .episodes:
            break
        case .locations:
            break
        }
    }
    
    func selectItemAt(_ indexPath: IndexPath) {
        let section = Section(rawValue: indexPath.section)
        switch section {
        case .characters:
            guard let content = characters.object(index: indexPath.row) else {
                return
            }
            router.loadCharacterDetailController(content: content)
        default:
            break
        }
    }
}

// MARK: - Presenter Output Protocol
extension HomePresenter: HomeInteractorOutputProtocol {
    
}
