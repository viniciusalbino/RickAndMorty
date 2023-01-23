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
        Task.init {
            let request = await CharacterRequest().getWithParameters(dict: dto.dto())
            do {
                var result = try? request.get() as CharacterInfo
                result?.filterApplyed = dto.dto()
                output?.didExecutedSearch(result: result)
            }
        }
    }
}
