//
//  UIApplication+Extensions.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 23/01/23.
//

import Foundation
import UIKit

extension UIApplication {
    var currentWindow: UIWindow? {
        connectedScenes
        .filter{$0.activationState == .foregroundActive}
        .map{$0 as? UIWindowScene}
        .compactMap{$0}
        .first?.windows
        .filter{$0.isKeyWindow}.first
    }
}

extension UIApplication{
    var topViewController: UIViewController?{
        if currentWindow?.rootViewController == nil{
            return currentWindow?.rootViewController
        }
        
        var pointedViewController = currentWindow?.rootViewController
        
        while  pointedViewController?.presentedViewController != nil {
            switch pointedViewController?.presentedViewController {
            case let navagationController as UINavigationController:
                pointedViewController = navagationController.viewControllers.last
            case let tabBarController as UITabBarController:
                pointedViewController = tabBarController.selectedViewController
            default:
                pointedViewController = pointedViewController?.presentedViewController
            }
        }
        return pointedViewController
        
    }
}