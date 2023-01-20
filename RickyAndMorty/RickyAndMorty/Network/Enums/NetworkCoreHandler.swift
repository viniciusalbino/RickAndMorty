//
//  NetworkCoreHandler.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 19/01/23.
//

import Foundation

enum NetworkCoreHandler {
    case success
    
    case error(NetworkCoreErrorType)
    
    init(statusCode: Int) {
        switch NetworkCoreStatusCode(rawValue: statusCode) {
        case .noContent, .unknow:
            self = .error(.unknow)
        case .noConnection:
            self = .error(.noConnection)
        case .statusOK:
            self = .success
        case .badRequest:
            self = .error(.businessError)
        case .notFound:
            self = .error(.notFound)
        case .internalServerError:
            self = .error(.unknow)
        default:
            self = .error(.unknow)
        }
    }
}

enum NetworkCoreErrorType: Int, Swift.Error {
    case notFound
    case businessError
    case forbidden
    case serviceDown
    case cancelled
    case noConnection
    case unknow
}

enum NetworkCoreStatusCode: Int {
    case noConnection = 0
    case unknow = -998
    
    case statusOK = 200
    case noContent = 204
    case badRequest = 400
    case notFound = 404
    case internalServerError = 500
}
