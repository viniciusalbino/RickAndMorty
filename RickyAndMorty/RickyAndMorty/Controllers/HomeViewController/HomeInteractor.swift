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
    
    func getCharacters() async -> CharacterInfo? {
        let request = await CharacterRequest().getAllCharacters()
        do {
            let result = try? request.get() as CharacterInfo
            return result
        }
    }
    
    func getEpisodes() async -> EpisodesInfo? {
        let request = await EpisodesRequest().getAllEpisodes()
        do {
            let result = try? request.get() as EpisodesInfo
            return result
        }
    }
    
    func getLocations() async -> LocationsInfo? {
        let request = await LocationsRequest().getAllLocations()
        do {
            let result = try? request.get() as LocationsInfo
            return result
        }
    }
}
