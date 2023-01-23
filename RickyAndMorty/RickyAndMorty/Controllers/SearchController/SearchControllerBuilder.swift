//
//  SearchControllerBuilder.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 22/01/23.
//

import Foundation
import UIKit

final class SearchControllerBuilder: ViewControllerBuilder {
    func build() -> UIViewController {
        let router = SearchRouter()
        let interactor = SearchInteractor()
        let presenter = SearchPresenter(router: router, interactor: interactor)
        interactor.output = presenter
        let viewController = SearchViewController(presenter: presenter)
        presenter.viewController = viewController
        router.viewController = viewController
        let navigationController = NavigationController(rootViewController: viewController)
        return navigationController
    }
}
