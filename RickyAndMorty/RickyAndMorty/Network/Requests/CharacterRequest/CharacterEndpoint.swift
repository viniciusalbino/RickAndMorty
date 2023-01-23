//
//  CharacterRequest.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 20/01/23.
//

import Foundation

enum CharacterEndpoint {
    case getById(Int)
    case getAll
    case getWithParameters([String: String])
}

extension CharacterEndpoint: NetworkCoreEndpoint {    
    var path: String {
        return "character/"
    }
    
    var task: NetworkCoreTask {
        switch self {
        case .getById(let id):
            return .requestParameters(parameters: ["id": "\(id)"])
        case .getAll:
            return .requestPlain
        case .getWithParameters(let dict):
            return .requestParameters(parameters: dict)
        }
    }
    
    var method: NetworkCoreMethod {
        return .get
    }
    
    var headers: [String : String] {
        return ["Content-Type": "application/json;charset=utf-8"]
    }
}
