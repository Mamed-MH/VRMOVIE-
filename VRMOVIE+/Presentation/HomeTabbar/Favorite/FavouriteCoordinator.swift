//
//  FavouriteCoordinator.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 14.02.2025.
//

import Foundation
import UIKit.UINavigationController

final class FavoriteCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = FavoriteViewController(viewModel: FavoriteViewModel(navigation: self))
        showController(vc: controller)
    }
}

extension FavoriteCoordinator: FavoriteNavigation, HomeNavigation {
    func navigateToMenu() {
        
        let homeVM = HomeViewModel(navigation: self)
        let homeVC = HomeViewController(viewModel: homeVM)
        navigationController.pushViewController(homeVC, animated: true)
    }
        
    func showDetails(mediaType: MediaType, id: Int) {
        let vc = MovieDetailController(viewModel: .init(mediaType: mediaType, id: id, navigation: self))
        vc.hidesBottomBarWhenPushed = true
        showController(vc: vc)
    }
    
    func showAllItems(listType: HomeListType) {
        return
    }
    
    func popController() {
        popControllerBack()
    }
}
