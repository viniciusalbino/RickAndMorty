//
//  Encodable+Extensions.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 19/01/23.
//

import Foundation

extension Encodable {
    func encoded() -> Data {
        guard let encoded = try? JSONEncoder().encode(self) else {
            return Data()
        }
        return encoded
    }
}
