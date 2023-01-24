//
//  EpisodeRequest.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 21/01/23.
//

import Foundation

final class GetAllEpisodesRequest: NetworkCoreRequestable {
    var network = NetworkCore.defaultNetwork
    let endpoint: NetworkCoreEndpoint = GetAllEpisodesEndpoint()
    
    func request(completion: @escaping (Result<EpisodesInfo, NetworkCoreErrorType>) -> Void) {
        network.request(for: endpoint) { response in
            switch response.handler {
            case .success:
                if let data = response.data <--> EpisodesInfo.self {
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

struct GetAllEpisodesEndpoint: NetworkCoreEndpoint {
    var path: String {
        return "episode/"
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

