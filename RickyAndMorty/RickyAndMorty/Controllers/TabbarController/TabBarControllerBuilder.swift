//
//  TabBarControllerBuilder.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 20/01/23.
//

import Foundation
import UIKit

class TabBarControllerBuilder: ViewControllerBuilder {
    func build() -> UIViewController {
        let viewController = TabBarController()
        return viewController
    }
}
