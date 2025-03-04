//
//  StartViewModel.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 11.02.2025.
//

final class StartViewModel {
    private let navigation: AuthNavigation?

    init(navigation: AuthNavigation) {
        self.navigation = navigation
    }

    func showLogin() {
        navigation?.showLogin()
    }

    func showRegister() {
        navigation?.showRegister()
    }
}



