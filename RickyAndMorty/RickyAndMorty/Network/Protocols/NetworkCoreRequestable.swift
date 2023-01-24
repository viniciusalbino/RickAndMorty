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
    
    func request(completion: @escaping (Result<DataType, NetworkCoreErrorType>) -> Void)
}
