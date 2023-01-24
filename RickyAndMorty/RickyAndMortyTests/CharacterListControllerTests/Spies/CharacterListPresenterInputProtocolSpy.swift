//
//  CharacterListPresenterInputProtocolSpy.swift
//  RickyAndMortyTests
//
//  Created by Vinicius Albino on 24/01/23.
//

import Foundation

@testable import RickyAndMorty

typealias CharacterListPresenterInputProtocolSpyDummy = CharacterListPresenterInputProtocolSpy

final class CharacterListPresenterInputProtocolSpy: CharacterListPresenterInputProtocol {
    private (set) var loadContentCount = 0
    private (set) var setContentCount = 0
    private (set) var itemForRowAtCount = 0
    private (set) var selectItemAtCount = 0
    private (set) var numberOfItensInSectionCount = 0
    
    func loadContent() {
        loadContentCount += 1
    }
    
    func setContent(content: CharacterInfo?) {
        setContentCount += 1
    }
    
    func numberOfItensInSection() -> Int {
        itemForRowAtCount += 1
        return 0
    }
    
    func itemForRowAt(_ row: Int) -> CharacterModel? {
        numberOfItensInSectionCount += 1
        return nil
    }
    
    func selectItemAt(_ row: Int) {
        selectItemAtCount += 1
    }
    
    
}
