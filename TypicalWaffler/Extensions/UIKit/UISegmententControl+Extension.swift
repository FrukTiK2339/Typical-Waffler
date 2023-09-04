//
//  UISegmententControl+Extension.swift
//  TypicalWaffler
//
//  Created by Дмитрий Рыбаков on 18.07.2023.
//

import Foundation
import UIKit

extension UISegmentedControl {
    
    convenience init(first: String, second: String) {
        self.init()
        self.insertSegment(withTitle: first, at: 0, animated: true)
        self.insertSegment(withTitle: second, at: 1, animated: true)
        self.selectedSegmentIndex = 0
    }
}
