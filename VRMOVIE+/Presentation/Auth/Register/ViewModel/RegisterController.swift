//
//  RegisterController.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 8.02.2025.
//


import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class RegisterController: BaseViewController {
    
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
    
    private lazy var nameTextField: UITextField = {
        let textfield = ReusableTextField(placeholder: "Username", iconName: "person", placeholderFont: "NexaRegular", iconTintColor: .accentMain, cornerRadius: 20, borderColor: .clear)
        textfield.textColor = .black
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.keyboardType = .default
        textfield.inputAssistantItem.leadingBarButtonGroups = []
        textfield.inputAssistantItem.trailingBarButtonGroups = []
        textfield.inputAccessoryView = nil
        return textfield
    }()
    
    private lazy var emailTextField: UITextField = {
        let textfield = ReusableTextField(placeholder: "Email", iconName: "envelope", placeholderFont: "NexaRegular", iconSetting: 6, iconTintColor: .accentMain, cornerRadius: 20, borderColor: .clear)
        textfield.textColor = .black
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.keyboardType = .default
        textfield.inputAssistantItem.leadingBarButtonGroups = []
        textfield.inputAssistantItem.trailingBarButtonGroups = []
        textfield.inputAccessoryView = nil
        return textfield
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textfield = ReusableTextField(placeholder: "Password", iconName: "lock", placeholderFont: "NexaRegular", iconTintColor: .accentMain, cornerRadius: 20, borderColor: .clear)
        textfield.delegate = self
        
        textfield.rightViewMode = .always
        textfield.isSecureTextEntry = true
        textfield.inputAssistantItem.leadingBarButtonGroups = []
        textfield.inputAssistantItem.trailingBarButtonGroups = []
        textfield.keyboardType = .default
        textfield.inputAccessoryView = nil

        
        textfield.textColor = .black
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    
    private lazy var signupButton: UIButton = {
        let button = ReusableButton(title: "Sign Up", onAction: signupButtonClicked,
                                    cornerRad: 20, bgColor: .primaryHighlight, titleColor: .white, titleSize: 20, titleFont: "Nexa-Bold")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    private let viewModel: RegisterViewModel
    
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setupUI()
        configureViewModel()
        removeErrorBorder()
    }
    
    
    private func configureViewModel() {
        viewModel.requestCallback = { [weak self] state in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch state {
                case .loading:
                    self.loadingView.startAnimating()
                case .loaded:
                    self.loadingView.stopAnimating()
                case .success:
                    self.showMessage(title: "User created", message: "User created successfully.")
                    self.viewModel.popController()
                case .error(let error):
                    self.showMessage(title: "Error", message: error)
                }
            }
        }
    }
    
    @objc fileprivate func signupButtonClicked() {
        checkInputRequirements()
    }
    
    @objc fileprivate func loginButtonTapped() {
        viewModel.showLoginScreen()
    }
    
    fileprivate func createUserWithPassword(email: String, password: String, username: String) {
        viewModel.createUser(email: email, password: password, username: username)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    fileprivate func removeErrorBorder() {
        nameTextField.errorBorderOff()
        emailTextField.errorBorderOff()
        passwordTextField.errorBorderOff()
    }
    
    @objc func checkInputRequirements() {
        guard let email = emailTextField.text, !email.isEmpty,
              let username = nameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
               showAlert(title: "Xəta", message: "Bütün sahələri doldurun.")
               return
           }

           FirebaseHelper.shared.createUserWithEmailUsername(email: email, username: username, password: password) { [weak self] result in
               DispatchQueue.main.async {
                   switch result {
                   case .success(.success):
                       self?.showAlert(title: "Uğur!", message: "İstifadəçi uğurla yaradıldı!") {
                           self?.navigateToLoginController()
                       }
                   case .failure(let error):
                       self?.showAlert(title: "Xəta", message: error.localizedDescription)
                   default:
                       break
                }
            }
        }
    }
    
    func navigateToLoginController() {
           let email = emailTextField.text
           viewModel.navigation?.showLogin(withEmail: email)
    }

    
    
    func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            completion?()
        }))
        present(alert, animated: true, completion: nil)
    }


    
    
    
    fileprivate func checkErrorBorders(email: String, password: String, username: String) {
        if !username.isValidName() {
            nameTextField.errorBorderOn()
        } else {
            nameTextField.errorBorderOff()
        }
        if !email.isValidEmail() {
            emailTextField.errorBorderOn()
        } else {
            emailTextField.errorBorderOff()
        }
        if !password.isValidPassword() {
            passwordTextField.errorBorderOn()
        } else {
            passwordTextField.errorBorderOff()
        }
    }
    
    private func setupUI() {
        view.addSubview(backgroundImageView)
        view.addSubview(logoImageView)
        view.addSubview(circleImageView)
        view.addSubview(avatarImageView)
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signupButton)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        
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
            
            signupButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            signupButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signupButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signupButton.heightAnchor.constraint(equalToConstant: 50)
                        
        ])
    }
    
}

extension RegisterController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard textField.text != nil else {return}
    }
}

