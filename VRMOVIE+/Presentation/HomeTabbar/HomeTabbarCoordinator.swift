//
//  HomeTabbarCoordinator.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 12.02.2025.
//

import UIKit

final class HomeTabBarCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    private let window: UIWindow
    
    private let tabBarController = TabBarController()
    private var homeCoordinator: HomeCoordinator?
    private var favoriteCoordinator: FavoriteCoordinator?
    private var searchCoordinator: SearchCoordinator?
    private var profileCoordinator: ProfileCoordinator?
    
    init(
        window: UIWindow,
        navigationController: UINavigationController
    ) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        initializeHomeTabBar()
    }
    
    deinit {
        print("tabbar")
    }
    
    private func initializeHomeTabBar() {
        let homeNavigationController = UINavigationController()
        homeCoordinator = HomeCoordinator(navigationController: homeNavigationController)
        homeCoordinator?.parentCoordinator = parentCoordinator
        
        let favoriteNavigationController = UINavigationController()
        favoriteCoordinator = FavoriteCoordinator(navigationController: favoriteNavigationController)
        favoriteCoordinator?.parentCoordinator = parentCoordinator
        
        let searchNavigationController = UINavigationController()
        searchCoordinator = SearchCoordinator(navigationController: searchNavigationController)
        searchCoordinator?.parentCoordinator = parentCoordinator
        
        let profileNavigationController = UINavigationController()
        profileCoordinator = ProfileCoordinator(window: window, navigationController: profileNavigationController)
        profileCoordinator?.parentCoordinator = parentCoordinator
        
        let homeItem = UITabBarItem()
        homeItem.image = UIImage(systemName: "house")
        homeItem.selectedImage = UIImage(systemName: "house.fill")
        homeNavigationController.tabBarItem = homeItem
        homeNavigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        homeNavigationController.navigationBar.shadowImage = UIImage()
        
        let favoriteItem = UITabBarItem()
        favoriteItem.image = UIImage(systemName: "heart")
        favoriteItem.selectedImage = UIImage(systemName: "heart.fill")
        favoriteNavigationController.tabBarItem = favoriteItem
        
        let searchItem = UITabBarItem()
        searchItem.image = UIImage(systemName: "magnifyingglass")
        searchItem.selectedImage = UIImage(systemName: "magnifyingglass")
        searchNavigationController.tabBarItem = searchItem
        
        let profileItem = UITabBarItem()
        profileItem.image = UIImage(systemName: "person")
        profileItem.selectedImage = UIImage(systemName: "person.fill")
        profileNavigationController.tabBarItem = profileItem
        
        tabBarController.viewControllers = [
            homeNavigationController,
            searchNavigationController,
            favoriteNavigationController,
            profileNavigationController
        ]
        
        navigationController.setViewControllers([tabBarController], animated: false)
        navigationController.setNavigationBarHidden(true, animated: false)
        
        parentCoordinator?.children.append (
            homeCoordinator ?? HomeCoordinator(navigationController: UINavigationController())
        )
        
        parentCoordinator?.children.append (
            favoriteCoordinator ?? FavoriteCoordinator(navigationController: UINavigationController())
        )
        
        parentCoordinator?.children.append (
            searchCoordinator ?? SearchCoordinator(navigationController: UINavigationController())
        )
        
        parentCoordinator?.children.append (
            profileCoordinator ?? ProfileCoordinator(window: window, navigationController: UINavigationController())
        )
        
        homeCoordinator?.start()
        favoriteCoordinator?.start()
        profileCoordinator?.start()
        searchCoordinator?.start()
    }
}
