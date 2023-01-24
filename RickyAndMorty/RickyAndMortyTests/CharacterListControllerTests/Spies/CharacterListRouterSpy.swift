//
//  CharacterListRouterSpy.swift
//  RickyAndMortyTests
//
//  Created by Vinicius Albino on 24/01/23.
//

import Foundation

@testable import RickyAndMorty

typealias CharacterListRouterSpyDummy = CharacterListRouterSpy

final class CharacterListRouterSpy: CharacterListRouterProtocol {
    private (set) var loadCharacterDetailCount = 0
    private (set) var content: CharacterModel?
    
    func loadCharacterDetailController(content: CharacterModel) {
        loadCharacterDetailCount += 1
        self.content = content
    }
}
