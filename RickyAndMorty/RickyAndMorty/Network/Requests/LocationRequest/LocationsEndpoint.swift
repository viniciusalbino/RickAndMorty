//
//  LocationsEndpoint.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 21/01/23.
//

import Foundation

enum LocationsEndpoint {
    case getById(Int)
    case getAll
    case getbyPage(Int)
}

extension LocationsEndpoint: NetworkCoreEndpoint {
    var path: String {
        switch self {
        case .getById(let id):
            return "location/\(id)"
        case .getbyPage(let page):
            return "location/?page=\(page)"
        case .getAll:
            return "location"
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
