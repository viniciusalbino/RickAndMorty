//
//  CharacterDetailProtocols.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 22/01/23.
//

import Foundation

// MARK: - ViewController
protocol CharacterDetailPresenterOutputProtocol: AnyObject {
    
}

// MARK: - Presenter
protocol CharacterDetailPresenterInputProtocol: AnyObject {
    func getImageURL() -> String
    func getName() -> String
    func getStatus() -> String
    func getEpisode() -> String
    func getGender() -> String
}

// MARK: - Interactor
protocol CharacterDetailInteractorInputProtocol: AnyObject {
    
}

protocol CharacterDetailInteractorOutputProtocol: AnyObject {
    
}

// MARK: - Router
protocol CharacterDetailRouterProtocol: AnyObject {
    
}
