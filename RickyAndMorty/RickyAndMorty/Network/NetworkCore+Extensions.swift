//
//  NetworkCore+Extensions.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 20/01/23.
//

import Foundation

extension NetworkCore {
    static let defaultConfig = NetworkCoreConfiguration(logType: .min)
    static let defaultNetwork = NetworkCore(configuration: defaultConfig)
}

extension NetworkCoreEndpoint {
    var baseApiURL: String {
        return "https://rickandmortyapi.com/api/"
    }
    
    var baseURL: URL {
        return URL(string: baseApiURL)!
    }
}
