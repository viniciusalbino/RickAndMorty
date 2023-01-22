//
//  SecondaryButton.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 22/01/23.
//

import Foundation
import UIKit

class SecondaryButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration = buttonConfiguration
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configuration = buttonConfiguration
    }
    
    var buttonConfiguration: UIButton.Configuration {
        var configuration = UIButton.Configuration.filled()
        configuration.cornerStyle = .capsule
        configuration.baseForegroundColor = UIColor.designSystem(.textSecondaryColor)
        configuration.buttonSize = .large
        configuration.baseBackgroundColor = .clear
        return configuration
    }
}
