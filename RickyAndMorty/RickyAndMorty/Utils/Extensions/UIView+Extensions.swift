//
//  UIView+Extensions.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 22/01/23.
//

import Foundation
import UIKit

extension UIView {
    func pinToBounds(of view: UIView, customSpacing: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)) {
        translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: customSpacing.left),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: customSpacing.right),
            topAnchor.constraint(equalTo: view.topAnchor, constant: customSpacing.top),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: customSpacing.bottom)
        ])
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
    
    public func performUIUpdate(using closure: @escaping () -> Void) {
        // If we are already on the main thread, execute the closure directly
        if Thread.isMainThread {
            closure()
        } else {
            DispatchQueue.main.async(execute: closure)
        }
    }
}
