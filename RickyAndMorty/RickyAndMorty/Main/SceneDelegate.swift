//
//  SceneDelegate.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 19/01/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var tabBarWindow: UIWindow?
    // the window to present
    var presentedWindow: UIWindow?
    
    weak var scene: UIWindowScene?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        if let scene = scene as? UIWindowScene {
            self.scene = scene
            makeWindows(scene: scene)
            showMainContentWindow()
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    // MARK: - Window Management
    func present(_ controller: UIViewController) {
        tabBarWindow?.rootViewController?.present(controller, animated: true)
    }

    private func makeWindow(scene: UIWindowScene) -> UIWindow {
        let window = WindowWithViewOnTop(windowScene: scene)
        window.tintColor = .white
        return window
    }

    private func makeWindows(scene: UIWindowScene) {
        tabBarWindow = makeTabBarWindow()
    }

    func makeTabBarWindow() -> UIWindow {
        let tabBarWindow = makeWindow(scene: scene!)
        let tabBarController = TabBarControllerBuilder().build()
        tabBarWindow.rootViewController = tabBarController
        return tabBarWindow
    }
    
    private func showWindow(_ window: UIWindow?) {
         guard let window = window else { return }
         window.makeKeyAndVisible()
         presentedWindow = window
     }
    
    func showMainContentWindow() {
        showWindow(tabBarWindow)
    }
}

// Window that can keep some view always on top of other views
class WindowWithViewOnTop: UIWindow {

    private weak var keepInFront: UIView?

    func addSubviewAlwaysOnTop(_ view: UIView) {
        keepInFront = view
        addSubview(view)
    }

    override func addSubview(_ view: UIView) {
        super.addSubview(view)
        if let v = keepInFront {
            bringSubviewToFront(v)
        }
    }
}
