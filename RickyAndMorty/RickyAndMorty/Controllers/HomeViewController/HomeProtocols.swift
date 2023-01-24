//
//  HomeControllerProtocols.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 21/01/23.
//

import Foundation
import UIKit

// MARK: - ViewController
protocol HomePresenterOutputProtocol: AnyObject {
    func reloadData(data: [AnyHashable], section: Section)
}

// MARK: - Presenter
protocol HomePresenterInputProtocol: AnyObject {
    func loadContent()
    func loadSectionController(section: Section)
    func selectItemAt(_ indexPath: IndexPath)
}

// MARK: - Interactor
protocol HomeInteractorInputProtocol: AnyObject {
    func getCharacters()
    func getEpisodes()
    func getLocations()
}

protocol HomeInteractorOutputProtocol: AnyObject {
    func didGetCharacters(data: CharacterInfo?)
    func errorGettingCharacters(error: Error)
    
    func didGetEpisodes(data: EpisodesInfo?)
    func errorGettingEpisodes(error: Error)
    
    func didGetLocations(data: LocationsInfo?)
    func errorGettingLocations(error: Error?)
}

// MARK: - Router
protocol HomeRouterProtocol: AnyObject {
    func loadCharactersController()
    
    func loadCharacterDetailController(content: CharacterModel)
}
