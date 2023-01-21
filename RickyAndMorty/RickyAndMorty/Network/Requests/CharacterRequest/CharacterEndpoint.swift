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
    case getbyPage(Int)
}

extension CharacterEndpoint: NetworkCoreEndpoint {    
    var path: String {
        switch self {
        case .getById(let id):
            return "character/\(id)"
        case .getbyPage(let page):
            return "character/?page=\(page)"
        case .getAll:
            return "character"
        }
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
