//
//  GuestSessionUseCase.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 18.02.2025.
//

import Foundation

protocol GuestSessionUseCase {
    func createGuestSessiontoken(completion: @escaping(GuestSessionDTO?, String?) -> Void)
    func rateTvShow(titleID: String, sessionID: String, rating: Int, completion: @escaping(POSTSuccessDTO?, String?) -> Void)
    func rateMovie(titleID: String, sessionID: String, rating: Int, completion: @escaping(POSTSuccessDTO?, String?) -> Void)
    func getRatedMovies(id: String, completion: @escaping(RatedMovieListsDTO?, String?) -> Void)
    func getRatedTvShows(id: String, completion: @escaping(RatedTvShowsDTO?, String?) -> Void)
}
