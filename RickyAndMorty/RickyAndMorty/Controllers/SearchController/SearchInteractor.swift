//
//  SearchInteractor.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 22/01/23.
//

import Foundation

final class SearchInteractor {
    // MARK: - Viper properties
    weak var output: SearchInteractorOutputProtocol?
}

// MARK: - Input Protocol

extension SearchInteractor: SearchInteractorInputProtocol {
    func search(name: String) {
        let dto = CharacterSearchDTO(name: name)
        let requestable = GetCharactersParameters(parameters: dto.dto())
        requestable.request { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let data):
                self.output?.didExecutedSearch(result: data)
            case .failure(let error):
                break
//                self.output?.errorGettingCharacters(error: error)
            }
        }
    }
}
