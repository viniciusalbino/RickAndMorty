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
    
    var sut: CharacterListPresenter?
    
    private let modelMock = CharacterListPresenterTests.createMock()
    private let routerSpy = CharacterListRouterSpy()
    private let interactorSpy = CharacterInteractorInputProtocolSpy()
    private let viewControllerSPy = CharacterListPresenterOutputProtocolSpy()
    
    override func setUp() {
        super.setUp()
        
        sut = CharacterListPresenter(router: routerSpy, interactor: interactorSpy)
        sut?.viewController = viewControllerSPy
    }
    
    func testLoadContent() {
        sut?.setContent(content: CharacterInfo(info: Info(count: 0, pages: 2, next: "", previous: "") , results: []) )
        
        XCTAssertEqual(sut?.numberOfItensInSection(), 0)
        XCTAssertNil(sut?.itemForRowAt(0))
        
        sut?.loadContent()
        
        XCTAssertEqual(viewControllerSPy.loadContentCount, 1)
    }
    
    func testSetContent() {
        sut?.setContent(content: modelMock)
        
        XCTAssertNotNil(sut?.itemForRowAt(0))
        XCTAssertEqual(sut?.numberOfItensInSection(), 2)
    }
    
    func testSelectItemAt() {
        sut?.setContent(content: modelMock)
        sut?.selectItemAt(0)
        
        XCTAssertEqual(routerSpy.loadCharacterDetailCount, 1)
    }
    
    func testContent() {
        sut?.setContent(content: modelMock)
        XCTAssertEqual(sut?.numberOfItensInSection(), 2)
        
        let item = sut?.itemForRowAt(0)
        XCTAssertNotNil(item)
        XCTAssertEqual(item?.name, "Genital Washer")
        XCTAssertEqual(item?.status, "Alive")
        XCTAssertEqual(item?.species, "Human")
        XCTAssertEqual(item?.type, "Mytholog")
        XCTAssertEqual(item?.gender, "Male")
        XCTAssertEqual(item?.image, "https://rickandmortyapi.com/api/character/avatar/140.jpeg")
        XCTAssertEqual(item?.location.name, "Earth")
        XCTAssertEqual(item?.location.url, "http://www.google.com")
        XCTAssertEqual(item?.episode.first, "http://www.google.com")
        XCTAssertEqual(item?.url, "http://www.google.com")
        XCTAssertEqual(item?.created, "2017-12-27T18:47:44.566Z")
    }
}
