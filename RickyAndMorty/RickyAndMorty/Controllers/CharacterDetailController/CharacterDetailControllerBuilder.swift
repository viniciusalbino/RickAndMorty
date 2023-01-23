//
//  CharacterDetailControllerBuilder.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 22/01/23.
//

import Foundation
import UIKit

final class CharacterDetailControllerBuilder: ViewControllerBuilder {
    var content: CharacterModel
    
    init(content: CharacterModel) {
        self.content = content
    }
    
    func build() -> UIViewController {
        let router = CharacterDetailRouter()
        let interactor = CharacterDetailInteractor()
        let presenter = CharacterDetailPresenter(router: router, interactor: interactor)
        presenter.content = self.content
        interactor.output = presenter
        let viewController = CharacterDetailViewController(presenter: presenter)
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
}
