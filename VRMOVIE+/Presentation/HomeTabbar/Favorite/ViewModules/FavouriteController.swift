//
//  FavouriteController.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 14.02.2025.
//

import UIKit

final class FavouriteController: BaseViewController {
    private let viewModel: FavouriteViewModel
    
    init(viewModel: FavouriteViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        // Do any additional setup after loading the view.
    }
}
