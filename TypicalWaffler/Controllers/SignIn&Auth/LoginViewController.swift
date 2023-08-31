//
//  LoginViewController.swift
//  TypicalWaffler
//
//  Created by Дмитрий Рыбаков on 17.07.2023.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    let welcomeLabel = UILabel(text: "С возвращением!", font: .avenir26())
    
    let loginInLabel = UILabel(text: "Войти с")
    let orLabel = UILabel(text: "или")
    let emailLabel = UILabel(text: "Email")
    let passwordLabel = UILabel(text: "Пароль")
    let needAccountLabel = UILabel(text: "Нужен аккаунт?")
    
    let googleButton = UIButton(title: "Google", titleColor: .black, backgroundColor: .white, isShadow: true)
    let emailTextField = OneLineTextField()
    let passwordTextField = OneLineTextField()
    let loginButton = UIButton(title: "Войти", titleColor: .white, backgroundColor: .buttonDark(), cornerRadius: 4)
    let signInButton = UIButton(title: "Войти", titleColor: .buttonRed(), backgroundColor: .clear)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupConstraints()
        googleButton.customizedGoogleButton()
    }
    
    private func setupConstraints() {
        let loginWithView = ButtomFormView(label: loginInLabel, button: googleButton)
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField], axis: .vertical, spacing: 0)
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField], axis: .vertical, spacing: 0)
        
        let stackView = UIStackView(arrangedSubviews: [loginWithView, orLabel, emailStackView, passwordStackView, loginButton], axis: .vertical, spacing: 40)
        
        signInButton.contentHorizontalAlignment = .leading
        let bottomStackView = UIStackView(arrangedSubviews: [needAccountLabel, signInButton], axis: .horizontal, spacing: 10)
        bottomStackView.alignment = .firstBaseline
        
        
        view.addSubview(welcomeLabel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginButton.heightAnchor.constraint(equalToConstant: 60),
            
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        
    }
}

import SwiftUI

struct LoginViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = LoginViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}

