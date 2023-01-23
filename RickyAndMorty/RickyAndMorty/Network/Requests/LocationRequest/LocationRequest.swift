//
//  LocationRequest.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 21/01/23.
//

import Foundation

class LocationsRequest {
    var network = NetworkCore.defaultNetwork
    
    func getAllLocations() async -> Result<LocationsInfo, NetworkCoreErrorType> {
        let response = await network.request(for: LocationsEndpoint.getAll)
        switch response.handler {
        case .success:
            if let data = response.data <--> LocationsInfo.self {
                return .success(data)
            } else {
                return .failure(.businessError)
            }
        case .error(let error):
            return .failure(error)
        }
    }
    
    func getLocationByID(id: Int) async -> Result<Location, NetworkCoreErrorType> {
        let response = await network.request(for: LocationsEndpoint.getById(id))
        switch response.handler {
        case .success:
            if let data = response.data <--> Location.self {
                return .success(data)
            } else {
                return .failure(.businessError)
            }
        case .error(let error):
            return .failure(error)
        }
    }
    
    func getLocationByPage(id: Int) async -> Result<LocationsInfo, NetworkCoreErrorType> {
        let response = await network.request(for: LocationsEndpoint.getbyPage(id))
        switch response.handler {
        case .success:
            if let data = response.data <--> LocationsInfo.self {
                return .success(data)
            } else {
                return .failure(.businessError)
            }
        case .error(let error):
            return .failure(error)
        }
    }
}
