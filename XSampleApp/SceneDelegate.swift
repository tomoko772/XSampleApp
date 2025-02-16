//
//  SceneDelegate.swift
//  XSampleApp
//
//  Created by Tomoko T. Nakao on 2025/02/11.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: scene)
        // タブバーコントローラの作成
        let tabBarController = UITabBarController()
        
        // 各ビューコントローラの作成
        let homeVC = HomeViewController()
        let searchVC = UIViewController()
        let communityVC = UIViewController()
        let notificationVC = UIViewController()
        let messageVC = UIViewController()
        
        // 各ビューコントローラをナビゲーションコントローラにラップ
        let homeNav = UINavigationController(rootViewController: homeVC)
        let searchNav = UINavigationController(rootViewController: searchVC)
        let communityNav = UINavigationController(rootViewController: communityVC)
        let notificationNav = UINavigationController(rootViewController: notificationVC)
        let messageNav = UINavigationController(rootViewController: messageVC)
        
        // タブバーアイテムの設定
        homeNav.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ic_home"), tag: 0)
        searchNav.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ic_search"), tag: 1)
        communityNav.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ic_friends"), tag: 2)
        notificationNav.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ic_bell"), tag: 3)
        messageNav.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ic_mail"), tag: 4)
        
        // タブバーコントローラにビューコントローラを設定
        tabBarController.viewControllers = [homeNav, searchNav, communityNav, notificationNav, messageNav]
        
        // ウィンドウのルートビューコントローラとしてタブバーコントローラを設定
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
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
}
