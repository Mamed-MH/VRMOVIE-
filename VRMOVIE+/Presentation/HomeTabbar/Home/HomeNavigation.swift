//
//  HomeNavigation.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 13.02.2025.
//

import Foundation

enum MediaType: String {
    case movie
    case tvShow
}

protocol HomeNavigation: AnyObject {
    func showDetails(mediaType: MediaType, id: Int)
//    func showAllItems(listType: HomeListType)
    func popController()
}
