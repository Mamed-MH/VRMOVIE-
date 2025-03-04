//
//  LoginViewModel.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 3.02.2025.
//

import UIKit

final class LoginViewModel {
    
    private let navigation: AuthNavigation?

    init(navigation: AuthNavigation) {
        self.navigation = navigation
    }
    
    func validateInputs(email: String?, password: String?) -> String? {
        guard let email = email, !email.isEmpty else {
            return "Email boş ola bilməz."
        }
        
        if !email.isValidEmail() {
            return "Düzgün email formatı daxil edin."
        }
        
        guard let password = password, !password.isEmpty else {
            return "Şifrə boş ola bilməz."
        }
        
        if !password.isValidPassword() {
            return "Şifrə ən azı 6 simvol, 1 böyük hərf və 1 rəqəm olmalıdır."
        }
        
        return nil
    }
    
    func loginUser(email: String, password: String) {
        print("Giriş uğurlu oldu: \(email)")
        navigation?.showHomeScreen()
    }
}
