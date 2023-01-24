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
        var parameters = filter
        parameters.addDictionary(dictionaryToAppend: ["page": "\(page)"])
        let requestable = GetCharactersParameters(parameters: parameters)
        requestable.request { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let data):
                self.output?.didLoadContent(result: data)
            case .failure(let error):
                break
//                self.output?.errorGettingCharacters(error: error)
            }
        }
    }  
}
