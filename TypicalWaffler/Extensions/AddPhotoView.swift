//
//  AddPhotoView.swift
//  TypicalWaffler
//
//  Created by Дмитрий Рыбаков on 17.07.2023.
//

import Foundation
import UIKit

class AddPhotoView: UIView {
    
    let cicrleImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "avatar")
        imageView.contentMode = .center
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = #imageLiteral(resourceName: "plus")
        button.setImage(image, for: .normal)
        button.tintColor = .buttonDark()
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        self.addSubview(cicrleImageView)
        self.addSubview(plusButton)
        
        NSLayoutConstraint.activate([
            cicrleImageView.topAnchor.constraint(equalTo: self.topAnchor),
            cicrleImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cicrleImageView.widthAnchor.constraint(equalToConstant: 120),
            cicrleImageView.heightAnchor.constraint(equalToConstant: 120),
            
            plusButton.leadingAnchor.constraint(equalTo: cicrleImageView.trailingAnchor, constant: 16),
            plusButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 30),
            plusButton.heightAnchor.constraint(equalToConstant: 30),
            
            self.bottomAnchor.constraint(equalTo: cicrleImageView.bottomAnchor),
            self.trailingAnchor.constraint(equalTo: plusButton.trailingAnchor)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cicrleImageView.layer.masksToBounds = true
        cicrleImageView.layer.cornerRadius = cicrleImageView.frame.width / 2
    }
}
