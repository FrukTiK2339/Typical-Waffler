//
//  ActiveChatCell.swift
//  TypicalWaffler
//
//  Created by Дмитрий Рыбаков on 18.07.2023.
//

import Foundation
import UIKit

class ActiveChatCell: UICollectionViewCell, SelfConfiguringCell {
    static var reuseId: String = "ActiveChatCell"
    
    let friendImageView = UIImageView()
    let friendNameLabel = UILabel(text: "User name", font: .laoSangamMN20())
    let lastMessageLabel = UILabel(text: "How are you?", font: .laoSangamMN18())
    let gradientView = GradientView(from: .topTraling, to: .bottomLeading, startColor: .startGradientColor(), endColor: .endGradientColor())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
        
        
        self.addSubview(friendImageView)
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(friendNameLabel)
        friendNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.addSubview(lastMessageLabel)
        lastMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(gradientView)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        gradientView.backgroundColor = .black
        
        NSLayoutConstraint.activate([
            friendImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            friendImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            friendImageView.heightAnchor.constraint(equalToConstant: 78),
            friendImageView.widthAnchor.constraint(equalToConstant: 78),
            
            friendNameLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 12),
            friendNameLabel.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16),
            friendNameLabel.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: -16),
        
            lastMessageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -16),
            lastMessageLabel.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16),
            lastMessageLabel.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: -16),
            
            gradientView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            gradientView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            gradientView.heightAnchor.constraint(equalToConstant: 78),
            gradientView.widthAnchor.constraint(equalToConstant: 8),
        ])
    }
    
    func configure<U>(with value: U) {
        guard let chatModel = value as? MChat else { return }
        friendImageView.image = UIImage(named: chatModel.userImageString)
        friendNameLabel.text = chatModel.username
        lastMessageLabel.text = chatModel.lastMessage
    }
    
}
