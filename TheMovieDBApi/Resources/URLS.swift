//
//  URLS.swift
//  TheMovieDBApi
//
//  Created by Сергей Кудинов on 30.11.2021.
//

import Foundation

enum URLS: String {
    case mainURL = "https://api.themoviedb.org/3/"
    case imageURL = "https://image.tmdb.org/t/p/w500"
    case trendingMoviesPath = "trending/movie/week?api_key="
    case trendingSerialsPath = "trending/tv/week?api_key="
}
