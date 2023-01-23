//
//  UIStackView+Extensions.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 23/01/23.
//

import Foundation
import UIKit

extension UIStackView {
    func addHorizontalSeparators(color : UIColor) {
        var i = self.arrangedSubviews.count
        while i > 0 {
            let separator = createSeparator(color: color)
            insertArrangedSubview(separator, at: i)
            separator.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
            i -= 1
        }
    }

    private func createSeparator(color : UIColor) -> UIView {
        let separator = UIView()
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separator.backgroundColor = color
        return separator
    }
}

