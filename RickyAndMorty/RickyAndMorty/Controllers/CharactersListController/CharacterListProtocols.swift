//
//  CharacterListProtocols.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 22/01/23.
//

import Foundation

// MARK: - ViewController
protocol CharacterListPresenterOutputProtocol: AnyObject {
    func didFinishedLoadingContent(success: Bool)
    func failedLoadContent()
}

// MARK: - Presenter
protocol CharacterListPresenterInputProtocol: AnyObject {
    func loadContent()
    func setContent(content: CharacterInfo?)
    func numberOfItensInSection() -> Int
    func itemForRowAt(_ row: Int) -> CharacterModel?
    func selectItemAt(_ row: Int)
}

// MARK: - Interactor
protocol CharacterInteractorInputProtocol: AnyObject {
    func loadPage(page: Int, filter: [String: String])
}

protocol CharacterListInteractorOutputProtocol: AnyObject {
    func didLoadContent(result: CharacterInfo?)
    func failedLoadContent()
}

// MARK: - Router
protocol CharacterListRouterProtocol: AnyObject {
    func loadCharacterDetailController(content: CharacterModel)
}

