//
//  GetAllCharactersRequest.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 24/01/23.
//

import Foundation

final class GetAllCharactersRequest: NetworkCoreRequestable {
    let network = NetworkCore.defaultNetwork
    let endpoint: NetworkCoreEndpoint = GetAllCharacterEndpoint()
    
    func request(completion: @escaping (Result<CharacterInfo, NetworkCoreErrorType>) -> Void) {
        network.request(for: endpoint) { response in
            switch response.handler {
            case .success:
                if let data = response.data <--> CharacterInfo.self {
                    completion(.success(data))
                } else {
                    completion(.failure(.businessError))
                }
            case .error(let errorType):
                completion(.failure(errorType))
            }
        }
    }
}

struct GetAllCharacterEndpoint: NetworkCoreEndpoint {
    var path: String {
        return "character/"
    }
    
    var task: NetworkCoreTask {
        return .requestPlain
    }
    
    var method: NetworkCoreMethod {
        return .get
    }
    
    var headers: [String : String] {
        return ["Content-Type": "application/json;charset=utf-8"]
    }
}
