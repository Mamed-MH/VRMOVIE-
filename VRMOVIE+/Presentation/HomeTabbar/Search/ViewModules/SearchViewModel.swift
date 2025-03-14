//
//  SearchViewModel.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 24.02.2025.
//

import Foundation

final class SearchViewModel {
    enum ViewState {
        case loading
        case loaded
        case success
        case morePageLoading
        case morePageLoaded
        case error(message: String)
    }
    
    var requestCallback : ((ViewState) -> Void?)?
    private weak var navigation: SearchNavigation?
    private var pages: Int = 0
    private var currentPage: Int = 1
    
    init(navigation: SearchNavigation) {
        self.navigation = navigation
    }
    
    private var movieListsUse: MovieListsUseCase = MovieListsAPIService()
    private var tvShowListsUse: TvShowListsUseCase = TvShowListsAPIService()
    
    private(set) var movieSearchDto: [TitleImageCellProtocol] = []
    private(set) var tvShowSearchDto: [TitleImageCellProtocol] = []
    
    func showMovieDetail(mediaType: MediaType, id: Int) {
        navigation?.showDetails(mediaType: mediaType, id: id)
    }
    
    func getItem(index: Int, mediaType: MediaType) -> Int {
        switch mediaType {
        case .movie:
            return movieSearchDto[index].idInt
        case .tvShow:
            return tvShowSearchDto[index].idInt
        }
    }
    
    func loadMorePage(mediaType: MediaType, query: String) {
        if currentPage >= pages { return }

        currentPage += 1
        if mediaType == .movie {
            movieLoadMore(query: query)
        } else {
            tvShowLoadMore(query: query)
        }
    }
    
    func getList(mediaType: MediaType, query: String) {
        if mediaType == .movie {
            movieSearch(query: query)
        } else {
            tvShowSearch(query: query)
        }
    }
    
    fileprivate func movieSearch(query: String) {
        requestCallback?(.loading)
        movieListsUse.getMovieSearchResults(query: query, page: "1") { [weak self] dto, error in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.requestCallback?(.loaded)
                if let dto = dto {
                    self.movieSearchDto = dto.results.map({ $0.mapToDomain() })
                    self.pages = dto.totalPages
                    self.currentPage = 1
                    self.requestCallback?(.success)
                } else if let error = error {
                    self.requestCallback?(.error(message: error))
                }
            }
        }
    }
    
    fileprivate func movieLoadMore(query: String) {
        requestCallback?(.morePageLoading)
        movieListsUse.getMovieSearchResults(query: query, page: String(currentPage)) { [weak self] dto, error in
            DispatchQueue.main.async {
                guard let self = self else { return }
                if let dto = dto {
                    self.movieSearchDto += dto.results.map({ $0.mapToDomain() })
                    self.requestCallback?(.morePageLoaded)
                    self.requestCallback?(.success)
                } else if let error = error {
                    self.requestCallback?(.error(message: error))
                }
            }
        }
    }
    
    func getMovieSearchItemsProtocol(index: Int) -> TitleImageCellProtocol? {
        return movieSearchDto[index]
    }
    
    func getMovieSearchItems() -> Int {
        movieSearchDto.count
    }
    
    fileprivate func tvShowSearch(query: String) {
        requestCallback?(.loading)
        tvShowListsUse.getTvShowSearchResults(query: query, page: "1") { [weak self] dto, error in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.requestCallback?(.loaded)
                if let dto = dto {
                    self.tvShowSearchDto = dto.results.map({ $0.mapToDomain() })
                    self.pages = dto.totalPages
                    self.currentPage = 1
                    self.requestCallback?(.success)
                } else if let error = error {
                    self.requestCallback?(.error(message: error))
                }
            }
        }
    }
    
    fileprivate func tvShowLoadMore(query: String) {
        requestCallback?(.morePageLoading)
        tvShowListsUse.getTvShowSearchResults(query: query, page: String(currentPage)) { [weak self] dto, error in
            DispatchQueue.main.async {
                guard let self = self else { return }
                if let dto = dto {
                    self.tvShowSearchDto += dto.results.map({ $0.mapToDomain() })
                    self.requestCallback?(.morePageLoaded)
                    self.requestCallback?(.success)
                } else if let error = error {
                    self.requestCallback?(.error(message: error))
                }
            }
        }
    }
    
    func getTvShowSearchItems() -> Int {
        tvShowSearchDto.count
    }
    
    func getTvShowSearchItemsProtocol(index: Int) -> TitleImageCellProtocol? {
        return tvShowSearchDto[index]
    }
}
