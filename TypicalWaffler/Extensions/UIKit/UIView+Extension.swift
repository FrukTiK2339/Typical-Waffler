//
//  UIView+Extension.swift
//  TypicalWaffler
//
//  Created by Дмитрий Рыбаков on 31.08.2023.
//

import UIKit

extension UIView {
    
    func applyGradients(cornerRadius: CGFloat) {
        self.backgroundColor = nil
        self.layoutIfNeeded()
        let gradientView = GradientView(from: .topTraling, to: .bottomLeading, startColor: .startGradientColor(), endColor: .endGradientColor())
        if let gradientLayer = gradientView.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = self.bounds
            gradientLayer.cornerRadius = cornerRadius
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
        
       
        
    }
}
