//
//  TabbarController.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 12.02.2025.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        // TabBar görünümünü özelleştir
        tabBar.backgroundColor = .black.withAlphaComponent(0.7)
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .lightGray
        
        // ViewControllers'ları oluştur
        let homeVC = HomeViewController(categoryCollectionViews: [], headerViews: [])
        homeVC.tabBarItem = UITabBarItem(title: "Home",
                                       image: UIImage(systemName: "house"),
                                       selectedImage: UIImage(systemName: "house.fill"))
        
        let searchVC = UIViewController()
        searchVC.tabBarItem = UITabBarItem(title: "Search",
                                         image: UIImage(systemName: "magnifyingglass"),
                                         selectedImage: UIImage(systemName: "magnifyingglass"))
        
        let favoriteVC = UIViewController()
        favoriteVC.tabBarItem = UITabBarItem(title: "Favorite",
                                           image: UIImage(systemName: "heart"),
                                           selectedImage: UIImage(systemName: "heart.fill"))
        
        let profileVC = UIViewController()
        profileVC.tabBarItem = UITabBarItem(title: "Me",
                                         image: UIImage(systemName: "person"),
                                         selectedImage: UIImage(systemName: "person.fill"))
        
        setViewControllers([homeVC, searchVC, favoriteVC, profileVC], animated: false)
    }
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
