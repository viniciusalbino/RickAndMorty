//
//  CharacterListPresenterOutputProtocolSpy.swift
//  RickyAndMortyTests
//
//  Created by Vinicius Albino on 24/01/23.
//

import Foundation
@testable import RickyAndMorty

typealias CharacterListPresenterOutputProtocolSpyDummy = CharacterListPresenterOutputProtocolSpy

final class CharacterListPresenterOutputProtocolSpy: CharacterListPresenterOutputProtocol {
    
    private (set) var loadContentCount = 0
    private (set) var failedLoadContentCount = 0
    
    func didFinishedLoadingContent(success: Bool) {
        loadContentCount += 1
    }
    
    func failedLoadContent() {
        failedLoadContentCount += 1
    }
}
