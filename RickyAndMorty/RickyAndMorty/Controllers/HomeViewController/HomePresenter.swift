//
//  HomeControllerPresenter.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 21/01/23.
//

import Foundation

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
        interactor.getCharacters()
        interactor.getEpisodes()
        interactor.getLocations()
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
    func didGetCharacters(data: CharacterInfo?) {
        guard let content = data else {
            return
        }
        characters = content.results
        viewController?.reloadData(data: characters, section: Section.characters)
    }
    
    func errorGettingCharacters(error: Error) {
        
    }
    
    func didGetEpisodes(data: EpisodesInfo?) {
        guard let content = data else {
            return
        }
        episodes = content.results
        viewController?.reloadData(data: episodes, section: Section.episodes)
    }
    
    func errorGettingEpisodes(error: Error) {
        
    }
    
    func didGetLocations(data: LocationsInfo?) {
        guard let content = data else {
            return
        }
        locations = content.results
        viewController?.reloadData(data: locations, section: Section.locations)
    }
    
    func errorGettingLocations(error: Error?) {
        
    }
}
