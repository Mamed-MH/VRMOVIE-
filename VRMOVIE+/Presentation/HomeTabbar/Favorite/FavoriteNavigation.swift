//
//  FavoriteNavigation.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 22.02.2025.
//

import Foundation

protocol FavoriteNavigation: AnyObject {
    func showDetails(mediaType: MediaType, id: Int)
}
