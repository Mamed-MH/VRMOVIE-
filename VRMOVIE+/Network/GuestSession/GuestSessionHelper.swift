//
//  GuestSessionHelper.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 18.02.2025.
//

import Foundation

enum GuestSessionHelper {
    case createGuestSession
    case rateMovie(titleID: String, sessionID: String)
    case rateTvShow(titleID: String, sessionID: String)
    case getRatedMovies(sessionID: String)
    case getRatedTvShows(sessionID: String)
    
    var endpoint: URL? {
        switch self {
        case .createGuestSession:
            return CoreAPIHelper.instance.makeURL(path: "authentication/guest_session/new")
        case .rateMovie(let titleID, let sessionId):
            return CoreAPIHelper.instance.makeURL(path: "movie/\(titleID)/rating?guest_session_id=\(sessionId)")
        case .rateTvShow(let titleID, let sessionId):
            return CoreAPIHelper.instance.makeURL(path: "tv/\(titleID)/rating?guest_session_id=\(sessionId)")
        case .getRatedMovies(let sessionId):
            return CoreAPIHelper.instance.makeURL(path: "guest_session/\(sessionId)/rated/movies")
        case .getRatedTvShows(let sessionId):
            return CoreAPIHelper.instance.makeURL(path: "guest_session/\(sessionId)/rated/tv")
        }
    }
}
