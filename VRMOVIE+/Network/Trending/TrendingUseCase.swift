//
//  TrendingUseCase.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 14.02.2025.
//

import Foundation
protocol TrendingUseCase {
    func getTrendingMovie(timeInterval: String, completion: @escaping(MovieDTO?, String?) -> Void?)
}
