//
//  CharacterListControllerTests.swift
//  RickyAndMortyTests
//
//  Created by Vinicius Albino on 24/01/23.
//

import Foundation
import XCTest

@testable import RickyAndMorty

final class CharacterListInteractorTests: XCTestCase {
    private let presenterSpy = CharacterInteractorOutpuProtocolSpy()
    private lazy var sut = CharacterListInteractor()
    
    override func setUp() {
        super.setUp()
        sut.output = presenterSpy
    }
    
    func testLoadSuccess() {
        sut.loadPage(page: 1, filter: [:])
        XCTAssertEqual(presenterSpy.fetchDataSuccessCount, 1)
    }
}
