//
//  CharacterListRouter.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 22/01/23.
//

import Foundation
import UIKit

final class CharacterListRouter {
    // MARK: - Private properties -
    weak var viewController: UIViewController?
}

extension CharacterListRouter: CharacterListRouterProtocol {
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
