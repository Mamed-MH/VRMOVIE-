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
        configureUI()
        setupFloatingTabBar()
        setGradientBackground()
        delegate = self
    }
    
    fileprivate func setupFloatingTabBar() {
        let radius: CGFloat = 25
        let height: CGFloat = 70
        
        let tabFrame = tabBar.frame
        tabBar.frame = CGRect(x: tabFrame.origin.x,
                              y: tabFrame.origin.y - 10,
                              width: tabFrame.width,
                              height: height)
        
        tabBar.layer.cornerRadius = radius
        tabBar.layer.masksToBounds = true
        tabBar.layer.borderWidth = 0
    }
    
    private func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.frame = tabBar.bounds

        let image = UIGraphicsImageRenderer(size: tabBar.bounds.size).image { rendererContext in
            gradientLayer.render(in: rendererContext.cgContext)
        }

        tabBar.backgroundImage = image
    }


    
    fileprivate func configureUI() {
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = tabBar.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        tabBar.addSubview(blurView)
        tabBar.sendSubviewToBack(blurView)
        
        tabBar.isTranslucent = true
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .lightGray
    }

}



extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        guard let tabBarItem = tabBar.selectedItem else { return }
        
        UIView.animate(withDuration: 0.3, animations: {
            tabBarItem.badgeColor = .white
            tabBarItem.setTitleTextAttributes([.font: UIFont.boldSystemFont(ofSize: 14)], for: .normal)
        })
    }
}

