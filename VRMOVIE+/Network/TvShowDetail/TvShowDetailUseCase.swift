//
//  TvShowDetailUseCase.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 18.02.2025.
//

import Foundation

protocol TvShowDetailUseCase {
    func getTvShowDetail(id: String, completion: @escaping(TvShowDetailDTO?, String?) -> Void)
    func getTvShowVideos(id: String, completion: @escaping(TitleVideoDTO?, String?) -> Void)
}
