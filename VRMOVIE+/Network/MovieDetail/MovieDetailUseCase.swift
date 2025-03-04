//
//  MovieDetailUseCase.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 18.02.2025.
//

import Foundation

protocol MovieDetailUseCase {
    func getMovieDetail(id: String, completion: @escaping(MovieDetailDTO?, String?) -> Void)
    func getMovieVideos(id: String, completion: @escaping(TitleVideoDTO?, String?) -> Void)
}
