//
//  CharacterInteractorOutputProtocolSpy.swift
//  RickyAndMortyTests
//
//  Created by Vinicius Albino on 24/01/23.
//

import Foundation
@testable import RickyAndMorty

typealias CharacterListInteractorOutputProtocolDummy = CharacterInteractorOutpuProtocolSpy

final class CharacterInteractorOutpuProtocolSpy: CharacterListInteractorOutputProtocol {
    private (set) var fetchDataSuccessCount = 0
    private (set) var fetchDataSuccessPassed: CharacterInfo?
    private (set) var fetchDataFailedCount = 0
    
    func didLoadContent(result: CharacterInfo?) {
        fetchDataSuccessCount += 1
        fetchDataSuccessPassed = result
    }
    
    func failedLoadContent() {
        fetchDataFailedCount += 1
    }
}
