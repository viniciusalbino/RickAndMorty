//
//  CharacterListPresenterTests.swift
//  RickyAndMortyTests
//
//  Created by Vinicius Albino on 24/01/23.
//

import Foundation
import XCTest

@testable import RickyAndMorty

final class CharacterListPresenterTests: XCTestCase {
    
    var presenter: CharacterListPresenter?
    
    override func setUp() {
        super.setUp()
        let interactor = CharacterListInteractor()
        presenter = CharacterListPresenter(router: MockedCharacterListRouter(), interactor: interactor)
        presenter?.viewController = MockPresenterOutput()
    }
    
    func testLoadContent() {
        presenter?.setContent(content: CharacterInfo(info: Info(count: 0, pages: 2, next: "", previous: "") , results: []) )
        
        XCTAssertEqual(presenter?.numberOfItensInSection(), 0)
        XCTAssertNil(presenter?.itemForRowAt(0))
        
        presenter?.loadContent()
    }
}

class MockedCharacterListRouter: CharacterListRouterProtocol {
    func loadCharacterDetailController(content: RickyAndMorty.CharacterModel) { }
}

private extension GetCharactersParametersEndpoint {
    var shouldMock: Bool {
        return true
    }
    
    var mockResponse: NetworkCoreResponse? {
        let jsonFile = Bundle(for: CharacterListPresenterTests.self).path(forResource: "CharacterList", ofType: "json") ?? ""
        let data = try? Data(contentsOf: URL(fileURLWithPath: jsonFile), options: .mappedIfSafe)
        return NetworkCoreResponse(statusCode: 200, data: data ?? Data(), headers: [:], handler: .success)
    }
}

class MockPresenterOutput: CharacterListPresenterOutputProtocol {
    
    
    
    
    func didFinishedLoadingContent(success: Bool) {
        
    }
}
