//
//  RegisterViewModel.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 12.02.2025.
//

import Foundation

final class RegisterViewModel {
    
    var navigation: AuthNavigation?
    
    init(navigation: AuthNavigation?) {
        self.navigation = navigation
    }
    
    func validateInputs(fullName: String?, email: String?, password: String?) -> String? {
        guard let fullName = fullName, !fullName.isEmpty else {
            return "Full Name boş ola bilməz."
        }
        
        guard let email = email, !email.isEmpty, isValidEmail(email) else {
            return "Düzgün email daxil edin."
        }
        
        guard let password = password, password.count >= 6 else {
            return "Şifrə ən azı 6 simvol olmalıdır."
        }
        
        return nil
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    func registerUser(fullName: String, email: String, password: String) {
        
        print("Qeydiyyat uğurlu oldu: \(fullName), \(email)")
        navigation?.showLogin()
    }
}

