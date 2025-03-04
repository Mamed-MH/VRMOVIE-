//
//  MovieListsUseCase.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 18.02.2025.
//

import Foundation

protocol MovieListsUseCase {
    func getTrendingMovies(time: Time, completion: @escaping(TrendingMovieDTO?, String?) -> Void)
    func getNowPlayingMovies(page: String, completion: @escaping(MovieListsDTO?, String?) -> Void)
    func getPopularMovies(page: String, completion: @escaping(MovieListsDTO?, String?) -> Void)
    func getTopRatedMovies(page: String, completion: @escaping(MovieListsDTO?, String?) -> Void)
    func getUpcomingMovies(page: String, completion: @escaping(MovieListsDTO?, String?) -> Void)
    func getMovieSearchResults(query: String, page: String, completion: @escaping(MovieListsDTO?, String?) -> Void)

}
