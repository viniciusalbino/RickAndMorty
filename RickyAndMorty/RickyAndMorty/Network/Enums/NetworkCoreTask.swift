//
//  NetworkCoreTask.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 19/01/23.
//

import Foundation

enum NetworkCoreTask {
    case requestPlain
    case requestParameters(parameters: [String: String])
    case requestCompositeBodyData(data: Data, urlParameters: [String: String])
}
