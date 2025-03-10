//
//  LoginController.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 3.02.2025.
//

import UIKit

final class LoginController: BaseViewController {
  
    private lazy var loadingView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.color = .white
        view.tintColor = .white
        view.hidesWhenStopped = true
        view.backgroundColor = .backgroundMain
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
    
    private lazy var loginButton: UIButton = {
        let button = ReusableButton(title: "Login", onAction: loginButtonClicked,
                                    cornerRad: 20, bgColor: .primaryHighlight, titleColor: .white, titleSize: 20, titleFont: "Nexa-Bold")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let viewModel: LoginViewModel
    
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    deinit {
        viewModel.requestCallback = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureConstaints()
        configureViewModel()
        
        
    }
    
    private func configureViewModel() {
        viewModel.loginSuccessCallback = { [weak self] in
                guard let self = self else { return }
                DispatchQueue.main.async { // ✅ `DispactionName` əvəzinə `DispatchQueue`
                    let alert = UIAlertController(
                        title: "Uğurlu Giriş!",
                        message: "Siz uğurlu daxil oldunuz.",
                        preferredStyle: .alert // ✅ `.alert` istifadə edin
                    )
                    let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                        self.navigateToMenu() // ✅ Düzgün funksiya adı
                    }
                    alert.addAction(okAction) // ✅ `addaction` əvəzinə `addAction`
                    self.present(alert, animated: true) // ✅ `minintest` əvəzinə `animated`
            }
        }

    }
    
    func navigateToMenu() {
        
        
        
    }
    
    
    @objc private func loginButtonClicked() {
        guard
            let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), // ✅ `.whitespacesAndNewlines`
            let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        else { return }
        
        if checkInput(email: email, password: password) {
        } else {
            showMessage(title: "Xəta", message: "Email və ya Şifrə yanlışdır")
        }
    }
    
    fileprivate func logUserIn() {
        guard let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
        viewModel.setInput(email: email, password: password)
        viewModel.checkLogin()
    }
    
    fileprivate func checkInput(email: String, password: String) -> Bool {
        return email.isValidEmail() && password.isValidPassword()
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
