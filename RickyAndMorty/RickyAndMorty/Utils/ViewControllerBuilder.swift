//
//  ViewControllerBuilder.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 20/01/23.
//

import Foundation
import UIKit
protocol ViewControllerBuilder: AnyObject {
    func build() -> UIViewController
}
