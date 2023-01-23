//
//  CharacterDetailInteractor.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 22/01/23.
//

import Foundation

final class CharacterDetailInteractor {
    // MARK: - Viper properties
    weak var output: CharacterDetailInteractorOutputProtocol?
}

// MARK: - Input Protocol

extension CharacterDetailInteractor: CharacterDetailInteractorInputProtocol {
    
}
