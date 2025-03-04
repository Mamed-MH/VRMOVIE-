//
//  SearchNavigation.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 24.02.2025.
//

import Foundation

protocol SearchNavigation: AnyObject {
    func showDetails(mediaType: MediaType, id: Int)
}
