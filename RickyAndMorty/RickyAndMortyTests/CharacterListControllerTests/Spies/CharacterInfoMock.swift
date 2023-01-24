//
//  CharacterInfoMock.swift
//  RickyAndMortyTests
//
//  Created by Vinicius Albino on 24/01/23.
//

import Foundation

@testable import RickyAndMorty

extension CharacterListPresenterTests {
    static func createMock() -> CharacterInfo {
        return CharacterInfo(info: Info(count: 1, pages: 2, next: "", previous: "") , filterApplyed: [ : ], results: [CharacterModel(id: 1, name: "Genital Washer", status: "Alive", species: "Human", type: "Mytholog", gender: "Male", origin: CharacterOrigin(name: "Earth", url: "http://www.google.com") , location: CharacterLocation(name: "Earth", url: "http://www.google.com"), image: "https://rickandmortyapi.com/api/character/avatar/140.jpeg", episode: ["http://www.google.com"], url: "http://www.google.com", created: "2017-12-27T18:47:44.566Z"),
                                                                                                       CharacterModel(id: 1, name: "Genital Washer", status: "Alive", species: "Human", type: "", gender: "Male", origin: CharacterOrigin(name: "", url: "") , location: CharacterLocation(name: "", url: ""), image: "https://rickandmortyapi.com/api/character/avatar/140.jpeg", episode: ["dsa"], url: "dsa", created: "dsa")])
    }
}
