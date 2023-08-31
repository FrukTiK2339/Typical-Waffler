//
//  UIViewContoller+Extension.swift
//  TypicalWaffler
//
//  Created by Дмитрий Рыбаков on 24.07.2023.
//

import UIKit

extension UIViewController {
    
    func configure<T: SelfConfiguringCell, U: Hashable>(collectionView: UICollectionView, cellType: T.Type, with value: U, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else {
            fatalError("Enable to dequeue \(cellType)")
        }
        cell.configure(with: value)
        return cell
    }
}
