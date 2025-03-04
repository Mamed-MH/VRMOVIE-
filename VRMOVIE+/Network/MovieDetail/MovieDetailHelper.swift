//
//  MovieDetailHelper.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 18.02.2025.
//

import Foundation

enum MovieDetailHelper {
    case movie(id: String)
    case videos(id: String)
    
    var endpoint: URL? {
        switch self {
        case .movie(let id):
            return CoreAPIHelper.instance.makeURL(path: "movie/\(id)")
        case .videos(let id):
            return CoreAPIHelper.instance.makeURL(path: "movie/\(id)/videos")
        }
    }
}
