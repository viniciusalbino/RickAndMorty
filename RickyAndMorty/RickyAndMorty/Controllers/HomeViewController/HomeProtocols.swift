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
    func handle(payload: NSDiffableDataSourceSnapshot<Section, AnyHashable>)
}

// MARK: - Presenter
protocol HomePresenterInputProtocol: AnyObject {
    func loadContent()
    func loadSectionController(section: Section)
    func selectItemAt(_ indexPath: IndexPath)
}

// MARK: - Interactor
protocol HomeInteractorInputProtocol: AnyObject {
    func getCharacters() async -> CharacterInfo?
    func getEpisodes() async -> EpisodesInfo?
    func getLocations() async -> LocationsInfo?
}

protocol HomeInteractorOutputProtocol: AnyObject {
    
}

// MARK: - Router
protocol HomeRouterProtocol: AnyObject {
    func loadCharactersController()
    
    func loadCharacterDetailController(content: CharacterModel)
}
