//
//  CharacterListPresenter.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 22/01/23.
//

import Foundation
import UIKit

final class CharacterListPresenter {
    
    // MARK: -  Viper Properties
    weak var viewController: CharacterListPresenterOutputProtocol?
    private let router: CharacterListRouterProtocol
    private let interactor: CharacterInteractorInputProtocol
    
    // MARK: - Properties
    private var content: [CharacterModel] = []
    private var info: CharacterInfo?
    private var currentFilter: [String: String]?
    var currentPage: Int = 1
    
    // MARK: - init
    init(router: CharacterListRouterProtocol, interactor: CharacterInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

// MARK: - Presenter Input Protocol
extension CharacterListPresenter: CharacterListPresenterInputProtocol {
    func loadContent() {
        // check if the info is nil, so do the first load
        guard let characterInfo = self.info else {
            self.interactor.loadPage(page: currentPage, filter: info?.filterApplyed ?? [:])
            return
        }
        // check if the currentPage is different than the total pages, otherwise is the last page
        guard currentPage != characterInfo.info.pages else {
            return
        }
        // check if the current page is less than the total pages, then load again
        if currentPage < characterInfo.info.pages {
            currentPage += 1
            interactor.loadPage(page: currentPage, filter: characterInfo.filterApplyed ?? [:])
        }
    }
    
    func setContent(content: CharacterInfo?) {
        guard let result = content else {
            viewController?.didFinishedLoadingContent(success: false)
            return
        }
        self.currentFilter = content?.filterApplyed
        self.info = content
        self.content = result.results
        
        viewController?.didFinishedLoadingContent(success: true)
    }
    
    func numberOfItensInSection() -> Int {
        return content.count
    }
    
    func itemForRowAt(_ row: Int) -> CharacterModel? {
        return content.object(index: row)
    }
    
    func selectItemAt(_ row: Int) {
        guard let content = content.object(index: row) else {
            return
        }
        router.loadCharacterDetailController(content: content)
    }
}

// MARK: - Presenter Output Protocol
extension CharacterListPresenter: CharacterListInteractorOutputProtocol {
    func didLoadContent(result: CharacterInfo?) {
        guard let result = result else {
            viewController?.didFinishedLoadingContent(success: false)
            return
        }
        info = result
        info?.filterApplyed = currentFilter
        content.append(contentsOf: result.results)
        
        viewController?.didFinishedLoadingContent(success: true)
    }
}
