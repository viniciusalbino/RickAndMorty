//
//  EpisodeRequest.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 21/01/23.
//

import Foundation

class EpisodesRequest {
    var network = NetworkCore.defaultNetwork
    
    func getAllEpisodes() async -> Result<EpisodesInfo, NetworkCoreErrorType> {
        let response = await network.request(for: EpisodesEndpoint.getAll)
        switch response.handler {
        case .success:
            if let data = response.data <--> EpisodesInfo.self {
                return .success(data)
            } else {
                return .failure(.businessError)
            }
        case .error(let error):
            return .failure(error)
        }
    }
    
    func getEpisodesByID(id: Int) async -> Result<Episode, NetworkCoreErrorType> {
        let response = await network.request(for: EpisodesEndpoint.getById(id))
        switch response.handler {
        case .success:
            if let data = response.data <--> Episode.self {
                return .success(data)
            } else {
                return .failure(.businessError)
            }
        case .error(let error):
            return .failure(error)
        }
    }
    
    func getEpisodeByPage(id: Int) async -> Result<EpisodesInfo, NetworkCoreErrorType> {
        let response = await network.request(for: EpisodesEndpoint.getbyPage(id))
        switch response.handler {
        case .success:
            if let data = response.data <--> EpisodesInfo.self {
                return .success(data)
            } else {
                return .failure(.businessError)
            }
        case .error(let error):
            return .failure(error)
        }
    }
}
