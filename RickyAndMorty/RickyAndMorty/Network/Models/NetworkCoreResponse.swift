//
//  NetworkCoreResponse.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 20/01/23.
//

import Foundation

struct NetworkCoreResponse {
    let statusCode: Int
    let data: Data
    let headers: [AnyHashable: Any]
    let handler: NetworkCoreHandler
    
    init(statusCode: Int, data: Data?, headers: [AnyHashable : Any], handler: NetworkCoreHandler) {
        self.statusCode = statusCode
        self.data = data ?? Data()
        self.headers = headers
        self.handler = handler
    }
}

extension NetworkCoreResponse {
    static var internalError: NetworkCoreResponse {
        let error = NetworkCoreErrorType.noConnection
        return NetworkCoreResponse(statusCode: error.rawValue, data: Data(), headers: [:], handler: .error(error))
    }
}
