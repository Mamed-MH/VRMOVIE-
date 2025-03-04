//
//  TvShowDetailHelper.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 18.02.2025.
//

import Foundation

enum TvShowDetailHelper {
    case tvshow(id: String)
    case videos(id: String)
    
    var endpoint: URL? {
        switch self {
        case .tvshow(let id):
            return CoreAPIHelper.instance.makeURL(path: "tv/\(id)")
        case .videos(let id):
            return CoreAPIHelper.instance.makeURL(path: "tv/\(id)/videos")
        }
    }
}
