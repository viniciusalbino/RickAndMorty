//
//  Dictionary+Extensions.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 19/01/23.
//

import Foundation

func +=<Key, Value> (left: inout [Key: Value], right: [Key: Value]) {
    for (key, value) in right {
        left[key] = value
    }
}
