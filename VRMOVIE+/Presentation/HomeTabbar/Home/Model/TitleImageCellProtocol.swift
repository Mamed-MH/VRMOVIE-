//
//  TitleImageCellProtocol.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 18.02.2025.
//

import Foundation

struct TitleImageCellProtocol {
    var titleString: String
    var imageString: String
    var overviewString: String
    var voteString: String
    var idInt: Int
}

struct TitleImageCellWithRatingProtocol {
    var titleString: String
    var imageString: String
    var overviewString: String
    var voteString: String
    var idInt: Int
    var ratingString: String
}
