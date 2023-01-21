//
//  EpisodesEndpoint.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 21/01/23.
//

import Foundation

enum EpisodesEndpoint {
    case getById(Int)
    case getAll
    case getbyPage(Int)
}

extension EpisodesEndpoint: NetworkCoreEndpoint {
    var path: String {
        switch self {
        case .getById(let id):
            return "episode/\(id)"
        case .getbyPage(let page):
            return "episode/?page=\(page)"
        case .getAll:
            return "episode"
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
