//
//  SearchPresenter.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 22/01/23.
//

import Foundation

final class SearchPresenter {
    
    // MARK: -  Viper Properties
    weak var viewController: SearchPresenterOutputProtocol?
    private let router: SearchRouterProtocol
    private let interactor: SearchInteractorInputProtocol
    
    // MARK: - Properties
    private var content: [CharacterModel] = []
    
    // MARK: - init
    init(router: SearchRouterProtocol, interactor: SearchInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

// MARK: - Presenter Input Protocol
extension SearchPresenter: SearchPresenterInputProtocol {
    func executeSearch(name: String) {
        interactor.search(name: name)
    }
    
    func numberOfItensInSection() -> Int {
        return content.count
    }
    
    func itemForRowAt(_ row: Int) -> CharacterModel? {
        return content.object(index: row)
    }
}

// MARK: - Presenter Output Protocol
extension SearchPresenter: SearchInteractorOutputProtocol {
    
    func didExecutedSearch(result: CharacterInfo?) {
        viewController?.didFinishedLoadingContent(result: result)
    }
}
