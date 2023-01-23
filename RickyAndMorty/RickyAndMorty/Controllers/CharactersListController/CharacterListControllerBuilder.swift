//
//  CharacterListControllerBuilder.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 22/01/23.
//

import Foundation
import UIKit

final class CharacterListControllerBuilder: ViewControllerBuilder {
    var firstFetch: Bool = false
    
    init(firstFetch: Bool) {
        self.firstFetch = firstFetch
    }
    
    func build() -> UIViewController {
        let router = CharacterListRouter()
        let interactor = CharacterListInteractor()
        let presenter = CharacterListPresenter(router: router, interactor: interactor)
        interactor.output = presenter
        let viewController = CharacterListViewController(presenter: presenter)
        presenter.viewController = viewController
        router.viewController = viewController
        if firstFetch {
            viewController.loadContent()
        }
        return viewController
    }
}
