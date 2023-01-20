//
//  NetworkCoreRequestable.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 19/01/23.
//

import Foundation

protocol NetworkCoreRequestable {
    associatedtype DataType: Codable
    
    var network: NetworkCore { get }
    
    var endpoint: NetworkCoreEndpoint { get }
    
    func sendRequest<T: Decodable>(endpoint: NetworkCoreEndpoint, responseModel: T.Type) async -> Result<T, NetworkCoreErrorType>
    
    func cancel()
}

extension NetworkCoreRequestable {
    func cancel() {
//        network.cancel()
    }
}
