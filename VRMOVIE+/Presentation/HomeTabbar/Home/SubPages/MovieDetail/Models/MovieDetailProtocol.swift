//
//  MovieDetailProtocol.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 22.02.2025.
//

import Foundation

struct MovieDetailProtocol {
    var backdropPathStr: String
    var genresArr: [String]
    var idInt: Int
    var imdbIDStr: String
    var originCountryStr: [String]
    var originalLanguageStr: String
    var originalTitleStr: String
    var overviewStr: String
    var popularityDbl: Double
    var posterPathStr: String
    var releaseDateStr: String
    var runtimeInt: Int
    var spokenLanguagesLng: [SpokenLanguage]
    var titleStr: String
    var voteAverageDbl: Double
    var voteCountInt: Int
}
