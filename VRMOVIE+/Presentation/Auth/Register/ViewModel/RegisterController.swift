//
//  RegisterController.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 8.02.2025.
//


import UIKit

class RegisterController: UIViewController {
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "vr")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var circleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "daire")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Full Name"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 25
        textField.layer.masksToBounds = true
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        textField.leftViewMode = .always
        textField.font = .systemFont(ofSize: 16)
        textField.textColor = .black
        textField.attributedPlaceholder = NSAttributedString(
            string: "Full Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email Address"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 25
        textField.layer.masksToBounds = true
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        textField.leftViewMode = .always
        textField.font = .systemFont(ofSize: 16)
        textField.textColor = .black
        textField.attributedPlaceholder = NSAttributedString(
            string: "Email Address",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 25
        textField.layer.masksToBounds = true
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        textField.leftViewMode = .always
        textField.font = .systemFont(ofSize: 16)
        textField.isSecureTextEntry = true
        textField.textColor = .black
        textField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var signUpButtonContainer: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "button")
        imageView.contentMode = .scaleToFill
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var signUpButtonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "signup")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(backgroundImageView)
        view.addSubview(logoImageView)
        view.addSubview(circleImageView)
        view.addSubview(avatarImageView)
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signUpButtonContainer)
        signUpButtonContainer.addSubview(signUpButtonImage)
        
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 60),
            
            circleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleImageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            circleImageView.widthAnchor.constraint(equalToConstant: 280),
            circleImageView.heightAnchor.constraint(equalToConstant: 280),
            
            avatarImageView.centerXAnchor.constraint(equalTo: circleImageView.centerXAnchor),
            avatarImageView.centerYAnchor.constraint(equalTo: circleImageView.centerYAnchor),
            avatarImageView.widthAnchor.constraint(equalTo: circleImageView.widthAnchor, multiplier: 0.9),
            avatarImageView.heightAnchor.constraint(equalTo: circleImageView.heightAnchor, multiplier: 0.9),
            
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.topAnchor.constraint(equalTo: circleImageView.bottomAnchor, constant: 40),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            signUpButtonContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButtonContainer.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            signUpButtonContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            signUpButtonContainer.heightAnchor.constraint(equalToConstant: 55),
            
            signUpButtonImage.centerXAnchor.constraint(equalTo: signUpButtonContainer.centerXAnchor),
            signUpButtonImage.centerYAnchor.constraint(equalTo: signUpButtonContainer.centerYAnchor),
            signUpButtonImage.widthAnchor.constraint(equalTo: signUpButtonContainer.widthAnchor, multiplier: 0.6),
            signUpButtonImage.heightAnchor.constraint(equalTo: signUpButtonContainer.heightAnchor, multiplier: 0.6)
        ])
    }
    
    @objc private func handleRegister() {
        
        guard let username = nameTextField.text, !username.isEmpty,
              let email = emailTextField.text, isValidEmail(email),
              let password = passwordTextField.text, password.count >= 8 else {
            showAlert(message: "Bütün məlumatları düzgün doldurun!")
            return
        }
        
        func isValidEmail(_ email: String) -> Bool {
            let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: email)
        }

        
        
        if users.contains(where: { $0.username == username || $0.email == email }) {
            showAlert(message: "Bu istifadəçi və ya email artıq mövcuddur!")
            return
        }
        
       
        let newUser = User(username: username, email: email, password: password)
        users.append(newUser)
        
        showAlert(message: "Qeydiyyat uğurla tamamlandı!") { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    private func showAlert(message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Bağla", style: .cancel) { _ in
            completion?()
        })
        present(alert, animated: true)
    }
    
    
}

extension RegisterController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard textField.text != nil else {return}
    }
}

