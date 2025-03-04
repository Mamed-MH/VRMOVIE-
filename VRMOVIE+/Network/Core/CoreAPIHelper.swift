//
//  CoreAPIHelper.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 12.02.2025.
//

import Foundation

enum HttpMethods: String {
    case GET
    case POST
    case PATCH
    case PUT
    case DELETE
}

final class CoreAPIHelper {
    static let instance = CoreAPIHelper()
    private init() {}
    private let baseURLV3 = "https://api.themoviedb.org/3/"
    
    func makeURL(path: String) -> URL? {
        let urlString = baseURLV3 + path
        return URL(string:urlString)
    }
    
    func makeHeader() -> [String: String] {
        return [
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MGNhNzc3NTM0ZTY5MjJmMmJiMjliMWU1Mzk4OGNiNiIsIm5iZiI6MTczNzQ2NzQyMC43MDgsInN1YiI6IjY3OGZhNjFjNDQ5YmI5Njg4YmFhYjhjOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ._jB0IQNdYsK51SUSmELurcZHbdVOnSzIkf_An0O-7JQ"]
    }
}


