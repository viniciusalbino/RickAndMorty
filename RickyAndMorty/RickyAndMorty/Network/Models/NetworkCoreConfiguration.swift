//
//  NetworkCoreConfiguration.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 20/01/23.
//

import Foundation

struct NetworkCoreConfiguration {
    let logType: NetworkCoreLogType
    
    init(logType: NetworkCoreLogType = .min) {
        self.logType = logType
    }
}
