//
//  CharacterListInteractor.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 22/01/23.
//

import Foundation

final class CharacterListInteractor {
    // MARK: - Viper properties
    weak var output: CharacterListInteractorOutputProtocol?
}

// MARK: - Input Protocol

extension CharacterListInteractor: CharacterInteractorInputProtocol {
    func loadPage(page: Int, filter: [String : String]) {
        Task.init {
            var parameters = filter
            parameters.addDictionary(dictionaryToAppend: ["page": "\(page)"])
            let request = await CharacterRequest().getWithParameters(dict: parameters)
            do {
                let result = try? request.get() as CharacterInfo
                output?.didLoadContent(result: result)
            }
        }
    }  
}
