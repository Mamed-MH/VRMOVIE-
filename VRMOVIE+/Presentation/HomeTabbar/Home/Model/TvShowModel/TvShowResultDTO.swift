//
//  TvShowResultDTO.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 19.02.2025.
//

import Foundation

struct TvShowResultDTO: Codable {
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]
    let id: Int
    let originCountry: [String]
    let originalLanguage: String
    let originalName, overview: String
    let popularity: Double
    let posterPath: String?
    let firstAirDate, name: String
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview, popularity
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case name
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

extension TvShowResultDTO {
    func mapToDomain() -> TitleImageCellProtocol {
        .init(titleString: name,
              imageString: posterPath ?? "",
              overviewString: overview,
              voteString: String(voteAverage),
              idInt: id
        )
    }
}
