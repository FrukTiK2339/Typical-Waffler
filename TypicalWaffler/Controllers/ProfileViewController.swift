//
//  ProfileViewController.swift
//  TypicalWaffler
//
//  Created by Дмитрий Рыбаков on 31.08.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let containerView = UIView()
    let imageView = UIImageView(image: #imageLiteral(resourceName: "human1") , contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Peter Ben", font: .systemFont(ofSize: 20, weight: .light))
    let aboutLabel = UILabel(text: "Just write me something", font: .systemFont(ofSize: 16, weight: .light))
    let myTextField = InsertableTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraint()
        
    }
    
    private func setupConstraint() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        
        aboutLabel.numberOfLines = 0
        containerView.backgroundColor = .mainWhite()
        containerView.layer.cornerRadius = 30
        
        if let button = myTextField.rightView as? UIButton {
            button.addTarget(self, action: #selector(addMessage), for: .touchUpInside)
        }
        
        view.addSubview(imageView)
        view.addSubview(containerView)
        
        containerView.addSubview(nameLabel)
        containerView.addSubview(aboutLabel)
        containerView.addSubview(myTextField)
        
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
            myTextField.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 8),
            myTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            myTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            myTextField.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    @objc private func addMessage() {
        print(#function)
    }
}



import SwiftUI

struct ProfileViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = ProfileViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
