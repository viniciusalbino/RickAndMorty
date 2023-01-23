//
//  SearchProtocols.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 22/01/23.
//

import Foundation
import UIKit

// MARK: - ViewController
protocol SearchPresenterOutputProtocol: AnyObject {
    func didFinishedLoadingContent(result: CharacterInfo?)
}

// MARK: - Presenter
protocol SearchPresenterInputProtocol: AnyObject {
    func executeSearch(name: String)
    func numberOfItensInSection() -> Int
    func itemForRowAt(_ row: Int) -> CharacterModel?
}

// MARK: - Interactor
protocol SearchInteractorInputProtocol: AnyObject {
    func search(name: String)
}

protocol SearchInteractorOutputProtocol: AnyObject {
    func didExecutedSearch(result: CharacterInfo?)
}

// MARK: - Router
protocol SearchRouterProtocol: AnyObject {
    
}

