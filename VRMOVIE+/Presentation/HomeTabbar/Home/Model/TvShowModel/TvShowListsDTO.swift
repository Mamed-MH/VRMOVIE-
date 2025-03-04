//
//  TvShowListsDTO.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 19.02.2025.
//

import Foundation

// MARK: - AiringTodayDTO
struct TvShowListsDTO: Codable {
    let page: Int
    let results: [TvShowResultDTO]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
