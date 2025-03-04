//
//  DemoMovieTitleImageCell.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 19.02.2025.
//

import Foundation

struct DemoMovieTitleImageCell{
    func mapToDomain() -> TitleImageCellProtocol {
        .init(titleString: "Test",
              imageString: "1E5baAaEse26fej7uHcjOgEE2t2.jpg",
              overviewString: "...",
              voteString: "0",
              idInt: 0)
    }
}
