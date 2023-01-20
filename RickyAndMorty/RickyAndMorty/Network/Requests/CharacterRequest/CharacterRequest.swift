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
}
