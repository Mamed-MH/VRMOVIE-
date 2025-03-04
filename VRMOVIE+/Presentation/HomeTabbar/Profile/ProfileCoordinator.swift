//
//  ProfileCoordinator.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 24.02.2025.
//

import Foundation
import UIKit.UINavigationController

final class ProfileCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    private let window: UIWindow
    
    init(window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = ProfileViewController(viewModel: ProfileViewModel(navigation: self))
        showController(vc: controller)
    }
}

extension ProfileCoordinator: ProfileNavigation {
    
    func showLaunchScreen() {

        
        navigationController.delegate = nil
        parentCoordinator = nil
        navigationController.setViewControllers([], animated: true)
        children.removeAll()
        
        let vc = UINavigationController()
        let authCoordinator = AuthCoordinator(window: window, navigationController: vc)
        
        authCoordinator.parentCoordinator = self
        children.append(authCoordinator)
        authCoordinator.start()
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }
}
