//
//  TvShowListsUseCase.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 18.02.2025.
//

import Foundation

protocol TvShowListsUseCase {
    func getTrendingTvShows(time: Time, completion: @escaping(TrendingTvShowDTO?, String?) -> Void)
    func getAiringTodayTvShows(page: String, completion: @escaping(TvShowListsDTO?, String?) -> Void)
    func getPopularTvShows(page: String, completion: @escaping(TvShowListsDTO?, String?) -> Void)
    func getTopRatedTvShows(page: String, completion: @escaping(TvShowListsDTO?, String?) -> Void)
    func getOnTheAirTvShows(page: String, completion: @escaping(TvShowListsDTO?, String?) -> Void)
    func getTvShowSearchResults(query: String, page: String, completion: @escaping(TvShowListsDTO?, String?) -> Void)
}
