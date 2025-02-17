//
//  TrendingHelper.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 14.02.2025.
//

import Foundation
enum TrendingHelper {
    case all(String)
    
    private var mainPath: String {
        return "trending/"
    }
    var endPoint: URL? {
        switch self {
            case .all(let query): return CoreAPIHelper.instance.makeURL(path:"\(mainPath)all/\(query)")
        }
    }
}
