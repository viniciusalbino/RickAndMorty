//
//  LocationRequest.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 21/01/23.
//

import Foundation

class GetAllLocationsRequest {
    var network = NetworkCore.defaultNetwork
    let endpoint: NetworkCoreEndpoint = GetAllLocationsEndpoint()
    
    func request(completion: @escaping (Result<LocationsInfo, NetworkCoreErrorType>) -> Void) {
        network.request(for: endpoint) { response in
            switch response.handler {
            case .success:
                if let data = response.data <--> LocationsInfo.self {
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

struct GetAllLocationsEndpoint: NetworkCoreEndpoint {
    var path: String {
        return "location/"
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


