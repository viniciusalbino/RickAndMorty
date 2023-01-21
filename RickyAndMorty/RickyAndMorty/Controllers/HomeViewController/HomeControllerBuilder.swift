//
//  HomeControllerBuilder.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 20/01/23.
//

import Foundation
import UIKit

final class HomeControllerBuilder: ViewControllerBuilder {
    func build() -> UIViewController {
        let controller = HomeViewController()
        let navigationController = NavigationController(rootViewController: controller)
        return navigationController
    }
}
