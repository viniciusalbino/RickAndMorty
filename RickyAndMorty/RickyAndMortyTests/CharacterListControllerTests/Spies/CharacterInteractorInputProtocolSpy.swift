//
//  CharacterListInteractorSpy.swift
//  RickyAndMortyTests
//
//  Created by Vinicius Albino on 24/01/23.
//

import Foundation
@testable import RickyAndMorty

typealias CharacterInteractorInputProtocolDummy = CharacterInteractorInputProtocolSpy

final class CharacterInteractorInputProtocolSpy: CharacterInteractorInputProtocol {
    
    private (set) var fetchDataCount = 0
    func loadPage(page: Int, filter: [String : String]) {
        fetchDataCount += 1
    }
}
