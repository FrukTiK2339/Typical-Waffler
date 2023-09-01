//
//  MainTabBarController.swift
//  TypicalWaffler
//
//  Created by Дмитрий Рыбаков on 18.07.2023.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    private let currentUser: MUser
    
    init(currentUser: MUser) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listViewController = ListViewController(currentUser: currentUser)
        let peopleViewController = PeopleViewController(currentUser: currentUser)
        
        tabBar.tintColor = .tabBarTint()
        
        let boldConf = UIImage.SymbolConfiguration(weight: .medium)
        let peopleImage = UIImage(systemName: "person.2", withConfiguration: boldConf)
        let convImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boldConf)
        
        viewControllers = [generateNavigationController(rootViewController: peopleViewController, title: "Поиск", image: peopleImage),
                           generateNavigationController(rootViewController: listViewController, title: "Чаты", image: convImage)]
        
        
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        let navVC = UINavigationController(rootViewController: rootViewController)
        navVC.tabBarItem.title = title
        navVC.tabBarItem.image = image
        return navVC
    }
}
