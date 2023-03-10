//
//  HomeRouter.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 21/01/23.
//

import Foundation
import UIKit

final class HomeRouter: HomeRouterProtocol {
    // MARK: - Private properties -
    weak var viewController: UIViewController?
    
    // MARK: - Module setup -
    func loadCharactersController() {
        let controller = CharacterListControllerBuilder(firstFetch: true).build()
        DispatchQueue.main.async {
            self.viewController?.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func loadCharacterDetailController(content: CharacterModel) {
        guard let navigationController = viewController?.navigationController else {
            return
        }
        let controller = CharacterDetailControllerBuilder(content: content).build()
        DispatchQueue.main.async {
            navigationController.pushViewController(controller, animated: true)
        }
    }
}
