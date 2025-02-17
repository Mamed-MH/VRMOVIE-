//
//  AppCoordinator.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 11.02.2025.
//

import Foundation
import UIKit.UINavigationController

final class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    // burada userDefaults'dan istifade edirik
    var isLogin: Bool = true
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if isLogin {
            showHome()
        } else {
            showAuth()
        }
    }
    
    fileprivate func showAuth() {
        children.removeAll()
//        let authCoordinator = AuthCoordinator(navigationController: navigationController)
//        children.append(authCoordinator)
//        authCoordinator.parentCoordinator = self
//        authCoordinator.start()
    }
    
    fileprivate func showHome() {
        
        navigationController.setViewControllers([], animated: true)
        children.removeAll()

        let homeVC = HomeViewController(categoryCollectionViews: [], headerViews: [])
        navigationController.setViewControllers([homeVC], animated: true)
    }

}
