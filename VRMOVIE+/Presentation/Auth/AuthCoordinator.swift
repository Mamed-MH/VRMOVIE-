//
//  AuthCoordinator.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 25.02.2025.
//

import Foundation
import UIKit.UINavigationController

final class AuthCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    private let window: UIWindow
    
    init(window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }
    
    deinit {
        print("deinit auth")
        parentCoordinator = nil
    }
    
    func start() {
        let controller = RegisterController(viewModel: .init(navigation: self))
        showController(vc: controller)
    }
}

extension AuthCoordinator: AuthNavigation {
    func showLogin(withEmail email: String?) {
        let loginViewModel = LoginViewModel(navigation: self)
            // LoginController-da e-maili doldurmaq üçün ViewModel-də saxlayırıq
        loginViewModel.prefilledEmail = email
            
        let loginVC = LoginController(viewModel: loginViewModel)
        showController(vc: loginVC)
        deletePreviousController() // Köhnə RegisterController-ı silmək üçün
    }
    
    func showRegister() {
        let viewModel = RegisterViewModel(navigation: self)
        let registerVC = RegisterController(viewModel: viewModel)
        navigationController.pushViewController(registerVC, animated: true)
        }
    
    func showLogin() {
        let loginVC = LoginController(viewModel: .init(navigation: self))
        showController(vc: loginVC)
        deletePreviousController()
    }
    
    func showSignUp() {
        let viewModel = RegisterViewModel(navigation: self)
        let vc = RegisterController(viewModel: viewModel)
        showController(vc: vc)
        deletePreviousController()
    }
    
    func showHomeScreen() {
        navigationController.delegate = nil
        parentCoordinator = nil
        navigationController.setViewControllers([], animated: true)
        children.removeAll()
        
        let vc = UINavigationController()
        let tabBar = HomeTabBarCoordinator(window: window, navigationController: vc)
        
        tabBar.parentCoordinator = self
        children.append(tabBar)
        tabBar.start()
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        
    }
    
    func popbackScreen() {
        popControllerBack()
    }
}

