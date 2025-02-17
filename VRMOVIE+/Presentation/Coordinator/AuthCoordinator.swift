//
//  AuthCoordinator.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 11.02.2025.
//

import UIKit.UINavigationController

final class AuthCoordinator: Coordinator {
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigationController = navigation
        self.navigation = navigation
    }
    
    func start() {
        let controller = StartController(viewModel: StartViewModel(navigation: self))
        showController(vc: controller)
    }
}

extension AuthCoordinator: AuthNavigation {
    func showRegister() {
        let controller = RegisterController()
        showController(vc: controller)
    }

    func showLogin() {
        let controller = LoginController(viewModel: LoginViewModel())
        showController(vc: controller)
    }
}

