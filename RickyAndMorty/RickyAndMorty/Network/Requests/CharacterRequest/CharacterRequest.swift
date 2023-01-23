//
//  CharacterRequest.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 20/01/23.
//

import Foundation

class CharacterRequest {
    var network = NetworkCore.defaultNetwork
    
    func getAllCharacters() async -> Result<CharacterInfo, NetworkCoreErrorType> {
        let response = await network.request(for: CharacterEndpoint.getAll)
        switch response.handler {
        case .success:
            if let data = response.data <--> CharacterInfo.self {
                return .success(data)
            } else {
                return .failure(.businessError)
            }
        case .error(let error):
            return .failure(error)
        }
    }
    
    func getCharacterByID(id: Int) async -> Result<CharacterModel, NetworkCoreErrorType> {
        let response = await network.request(for: CharacterEndpoint.getById(id))
        switch response.handler {
        case .success:
            if let data = response.data <--> CharacterModel.self {
                return .success(data)
            } else {
                return .failure(.businessError)
            }
        case .error(let error):
            return .failure(error)
        }
    }
    
    func getWithParameters(dict: [String: String]) async -> Result<CharacterInfo, NetworkCoreErrorType> {
        let response = await network.request(for: CharacterEndpoint.getWithParameters(dict))
        switch response.handler {
        case .success:
            if let data = response.data <--> CharacterInfo.self {
                return .success(data)
            } else {
                return .failure(.businessError)
            }
        case .error(let error):
            return .failure(error)
        }
    }
}
