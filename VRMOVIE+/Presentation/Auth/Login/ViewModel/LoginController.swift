//
//  LoginController.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 3.02.2025.
//

import UIKit

final class LoginController: UIViewController {
    
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
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureConstaints()
    }
    
    
    @objc private func loginButtonTapped() {
        let email = emailTextField.text
        let password = passwordTextField.text
        
        emailTextField.errorBorderOff()
        passwordTextField.errorBorderOff()
        
        if let errorMessage = viewModel.validateInputs(email: email, password: password) {
           
            if email?.isEmpty ?? true || !(email?.isValidEmail() ?? false) {
                emailTextField.errorBorderOn()
            }
            if password?.isEmpty ?? true || !(password?.isValidPassword() ?? false) {
                passwordTextField.errorBorderOn()
            }
            showAlert(message: errorMessage)
        } else {
           
            let alert = UIAlertController(title: "Uğurlu", message: "Giriş uğurla tamamlandı!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default) { [weak self] _ in
                self?.viewModel.loginUser(email: email!, password: password!)
            })
            present(alert, animated: true)
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Xəta", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    func configureConstaints() {
        
        view.addSubview(backgroundImageView)
        view.addSubview(circleImageView)
        view.addSubview(avatarImageView)
        view.addSubview(logoImageView)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            circleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleImageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            circleImageView.widthAnchor.constraint(equalToConstant: 280),
            circleImageView.heightAnchor.constraint(equalToConstant: 280),
            
            avatarImageView.centerXAnchor.constraint(equalTo: circleImageView.centerXAnchor),
            avatarImageView.centerYAnchor.constraint(equalTo: circleImageView.centerYAnchor),
            avatarImageView.widthAnchor.constraint(equalTo: circleImageView.widthAnchor, multiplier: 0.9),
            avatarImageView.heightAnchor.constraint(equalTo: circleImageView.heightAnchor, multiplier: 0.9),
            
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 60),
            
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: circleImageView.bottomAnchor, constant: 40),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
}
