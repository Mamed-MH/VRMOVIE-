//
//  SearchCoordinator.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 24.02.2025.
//

import Foundation
import UIKit.UINavigationController

final class SearchCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = SearchViewController(viewModel: SearchViewModel(navigation: self))
        showController(vc: controller)
    }
}

extension SearchCoordinator: SearchNavigation, HomeNavigation {
    func showAllItems(listType: HomeListType) {
        return
    }
    
    func popController() {
        popControllerBack()
    }
    
    func showDetails(mediaType: MediaType, id: Int) {
        let vc = MovieDetailController(viewModel: .init(mediaType: mediaType, id: id, navigation: self))
        vc.hidesBottomBarWhenPushed = true
        showController(vc: vc)
    }
}
