//
//  HomeCoordinator.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 13.02.2025.
//

import Foundation
import UIKit.UINavigationController

final class HomeCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = HomeViewController(viewModel: .init(navigation: self))
        showController(vc: controller)
    }
}

extension HomeCoordinator: HomeNavigation {
    func showAllItems(listType: HomeListType) {
        let vc = SeeAllItemsController(viewModel: .init(listType: listType, navigation: self))
        vc.hidesBottomBarWhenPushed = true
        showController(vc: vc)
    }
    
    func showDetails(mediaType: MediaType, id: Int) {
        let vc = MovieDetailController(viewModel: .init(mediaType: mediaType, id: id, navigation: self))
        vc.hidesBottomBarWhenPushed = true
        showController(vc: vc)
    }
    
    func popController() {
        popControllerBack()
    }
}


