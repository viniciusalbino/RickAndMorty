//
//  Dictionary+ExtensionsTests.swift
//  RickyAndMortyTests
//
//  Created by Vinicius Albino on 23/01/23.
//

import Foundation
import XCTest

@testable import RickyAndMorty

class DictionaryExtensionsTests: XCTestCase {
    func testConcateningValues() {
        var dictionary: [String: Any] = ["a": 1, "b": "string"]
        let expected: [String: Any] = ["a": 1, "b": "string", "c": true]
        dictionary += ["c": true]
        XCTAssertTrue(NSDictionary(dictionary: dictionary).isEqual(to: expected))
    }
}
