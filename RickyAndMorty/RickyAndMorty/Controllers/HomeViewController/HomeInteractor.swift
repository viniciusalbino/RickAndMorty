//
//  HomeInteractor.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 21/01/23.
//

import Foundation

final class HomeInteractor {
    // MARK: - Viper properties
    weak var output: HomeInteractorOutputProtocol?
}

// MARK: - Input Protocol

extension HomeInteractor: HomeInteractorInputProtocol {
    
    func getCharacters() {
        let requestable = GetAllCharactersRequest()
        requestable.request { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let data):
                self.output?.didGetCharacters(data: data)
            case .failure(let error):
                self.output?.errorGettingCharacters(error: error)
            }
        }
    }
    
    func getEpisodes() {
        let requestable = GetAllEpisodesRequest()
        requestable.request { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let data):
                self.output?.didGetEpisodes(data: data)
            case .failure(let error):
                self.output?.errorGettingEpisodes(error: error)
            }
        }
    }
    
    func getLocations()  {
        let requestable = GetAllLocationsRequest()
        requestable.request { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let data):
                self.output?.didGetLocations(data: data)
            case .failure(let error):
                self.output?.errorGettingLocations(error: error)
            }
        }
    }
}
