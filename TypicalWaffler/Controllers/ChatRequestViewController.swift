//
//  ChatRequestViewController.swift
//  TypicalWaffler
//
//  Created by Дмитрий Рыбаков on 31.08.2023.
//

import UIKit

class ChatRequestViewController: UIViewController {
    
    let containerView = UIView()
    let imageView = UIImageView(image: #imageLiteral(resourceName: "human1") , contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Peter Ben", font: .systemFont(ofSize: 20, weight: .light))
    let aboutLabel = UILabel(text: "Хотите начать общение?", font: .systemFont(ofSize: 16, weight: .light))
    let acceptButton = UIButton(title: "Принять", titleColor: .white, backgroundColor: .black, isShadow: false, font: .laoSangamMN20(), cornerRadius: 10)
    let denyButton = UIButton(title: "Отклонить", titleColor: .denyRedColor(), backgroundColor: .mainWhite(), isShadow: false, font: .laoSangamMN20(), cornerRadius: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    private func setupConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        denyButton.translatesAutoresizingMaskIntoConstraints = false
        
        denyButton.layer.borderWidth = 1.2
        denyButton.layer.borderColor = UIColor.denyRedColor().cgColor
        
       
        
        containerView.backgroundColor = .mainWhite()
        containerView.layer.cornerRadius = 30
        
        view.addSubview(imageView)
        view.addSubview(containerView)
        
        containerView.addSubview(nameLabel)
        containerView.addSubview(aboutLabel)
        
        let buttonsStackView = UIStackView(arrangedSubviews: [acceptButton, denyButton], axis: .horizontal, spacing: 7)
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.distribution = .fillEqually
        containerView.addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
            imageView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
        
        ])
        
        NSLayoutConstraint.activate([
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 206)
        
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 35),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
        ])
        
        NSLayoutConstraint.activate([
            aboutLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            aboutLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            aboutLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
        ])
        
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 24),
            buttonsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            buttonsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.acceptButton.applyGradients(cornerRadius: 10)
    }
}

import SwiftUI

struct ChatRequestViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = ChatRequestViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
