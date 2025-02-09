//
//  SignUpController.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 3.02.2025.
//

import UIKit

final class SignUpController: UIViewController {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
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
    
    private lazy var vr2ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "vr2")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var downloadLabel: UILabel = {
        let label = UILabel()
        label.text = "Download And Watch Offline\nWherever You Are"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    
    private let viewModel: SignUpViewModel
    
    init(viewModel: SignUpViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    func setupUI() {
        
        view.addSubview(backgroundImageView)
        view.addSubview(circleImageView)
        view.addSubview(avatarImageView)
        view.addSubview(logoImageView)
        view.addSubview(vr2ImageView)
        view.addSubview(downloadLabel)
        view.addSubview(signUpButtonContainer)
        signUpButtonContainer.addSubview(signUpButtonImage)
        
        
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
            
            vr2ImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vr2ImageView.topAnchor.constraint(equalTo: circleImageView.bottomAnchor, constant: 30),
            vr2ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33),
            vr2ImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -33),
            
            downloadLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadLabel.topAnchor.constraint(equalTo: vr2ImageView.bottomAnchor, constant: 30),
            downloadLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            downloadLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            signUpButtonContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButtonContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            signUpButtonContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            signUpButtonContainer.heightAnchor.constraint(equalToConstant: 55),
            
            signUpButtonImage.centerXAnchor.constraint(equalTo: signUpButtonContainer.centerXAnchor),
            signUpButtonImage.centerYAnchor.constraint(equalTo: signUpButtonContainer.centerYAnchor),
            signUpButtonImage.widthAnchor.constraint(equalTo: signUpButtonContainer.widthAnchor, multiplier: 0.6),
            signUpButtonImage.heightAnchor.constraint(equalTo: signUpButtonContainer.heightAnchor, multiplier: 0.6)
        ])
    }
    
}
