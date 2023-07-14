//
//  UIStackView+Extension.swift
//  TypicalWaffler
//
//  Created by Дмитрий Рыбаков on 14.07.2023.
//

import Foundation
import UIKit

extension UIStackView {
    
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
    }
}
