//
//  Result+ExtensionsTests.swift
//  RickyAndMortyTests
//
//  Created by Vinicius Albino on 23/01/23.
//

import Foundation
import XCTest
@testable import RickyAndMorty

struct Dummy: Mappable {
    init() {
    }
}

class ResultExtensionsTests: XCTestCase {
    
//    func testResultWithDummy() {
//        typealias ResultType = Result<Dummy, NetworkCoreErrorType>
//        let resultA: ResultType = {
//            return .success
//        }()
//        let resultB: ResultType = {
//            return .success(Dummy())
//        }()
//        if case let .success(dummyA) = resultA, case let .success(dummyB) = resultB {
//            XCTAssertNotNil(dummyA)
//            XCTAssertNotNil(dummyB)
//        } else {
//            assertionFailure("Unexpected result")
//        }
//    }
//    
//    func testResultWithOptional() {
//        typealias ResultType = Result<Dummy?, NetworkCoreErrorType>
//        let resultA: ResultType = {
//            return .success(dummyA)
//        }()
//        let resultB: ResultType = {
//            return .success(nil)
//        }()
//        if case let .success(dummyA) = resultA, case let .success(dummyB) = resultB {
//            XCTAssertNil(dummyA)
//            XCTAssertNil(dummyB)
//        } else {
//            assertionFailure("Unexpected result")
//        }
//    }
    
    func testResultWithError() {
        typealias ResultType = Result<Dummy, NetworkCoreErrorType>
        let resultA: ResultType = {
            return .failure(.unknown)
        }()
        let resultB: ResultType = {
            return .failure(.unknown)
        }()
        if case let .failure(errorA) = resultA, case let .failure(errorB) = resultB {
            XCTAssertEqual(errorA, .unknown)
            XCTAssertEqual(errorB, .unknown)
            XCTAssertEqual(errorA, errorB)
        } else {
            assertionFailure("Unexpected result")
        }
    }
}
