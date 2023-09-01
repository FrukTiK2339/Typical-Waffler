//
//  AuthViewController.swift
//  TypicalWaffler
//
//  Created by Дмитрий Рыбаков on 14.07.2023.
//

import UIKit
import GoogleSignIn

protocol AuthNavigationDelegate: AnyObject {
    func toLoginVC()
    func toSignUpVC()
}

class AuthViewController: UIViewController, AuthNavigationDelegate {
    
    let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Logo"), contentMode: .scaleAspectFill)
    
    let googleLabel = UILabel(text: "Зарегистрируйтесь с помощью")
    let emailLabel = UILabel(text: "или почты")
    let onboardLabel = UILabel(text: "Уже зарегистрированы?")
    
    let googleButton = UIButton(title: "Google", titleColor: .black, backgroundColor: .white, isShadow: true)
    let emailButton = UIButton(title: "Email", titleColor: .white, backgroundColor: .buttonDark())
    let loginButton = UIButton(title: "Войти", titleColor: .buttonRed(), backgroundColor: .white, isShadow: true)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        setupConstraints()
        googleButton.customizedGoogleButton()
        
        emailButton.addTarget(self, action: #selector(emailButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let googleView = ButtomFormView(label: googleLabel, button: googleButton)
        let emailView = ButtomFormView(label: emailLabel, button: emailButton)
        let onboardView = ButtomFormView(label: onboardLabel, button: loginButton)
        
        let stackView = UIStackView(arrangedSubviews: [googleView, emailView, onboardView], axis: .vertical, spacing: 40)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 160),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        ])
    }
    
    @objc private func emailButtonTapped() {
        toSignUpVC()
    }
    
    @objc private func loginButtonTapped() {
        toLoginVC()
    }
    
    func toLoginVC() {
        let loginViewController = LoginViewController()
        loginViewController.delegate = self
        present(loginViewController, animated: true)
    }
    
    func toSignUpVC() {
        let signUpViewController = SignUpViewController()
        signUpViewController.delegate = self
        present(signUpViewController, animated: true)
    }
    
    
    
}


import SwiftUI

struct AuthViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = AuthViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}

