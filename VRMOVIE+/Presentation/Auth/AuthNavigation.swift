//
//  AuthNavigation.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 25.02.2025.
//

import Foundation

protocol AuthNavigation: AnyObject {
    func showLogin()
    func showSignUp()
    func popbackScreen()
    func showHomeScreen()
    func showRegister()
}
