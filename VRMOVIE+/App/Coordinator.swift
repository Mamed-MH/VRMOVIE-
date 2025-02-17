//
//  Coordinator.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 11.02.2025.
//

import Foundation
import UIKit.UINavigationController

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

extension Coordinator {
    func childDidFinish(_ coordinator: Coordinator) {
        children.removeAll { $0 === coordinator }
    }
    
    func showController(vc: UIViewController) {
        navigationController.show(vc, sender: nil)
    }
    
    func popControllerBack() {
        navigationController.popViewController(animated: true)
    }
    
    func deletePreviousController() {
        let viewCount = navigationController.viewControllers.count
        guard viewCount > 2 else { return }
        navigationController.viewControllers.remove(at: 1)
    }
}
