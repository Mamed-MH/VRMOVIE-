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
        
        _ = HomeViewController(categoryCollectionViews: [], headerViews: [])
        guard let controller = HomeViewController(coder: .init()) else { return }
        showController(vc: controller)
        
    }
}


