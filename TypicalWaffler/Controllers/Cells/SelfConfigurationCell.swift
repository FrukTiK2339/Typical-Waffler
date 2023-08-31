//
//  SelfConfigurationCell.swift
//  TypicalWaffler
//
//  Created by Дмитрий Рыбаков on 21.07.2023.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure<U: Hashable>(with value: U)
}
