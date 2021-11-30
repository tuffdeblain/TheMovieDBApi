//
//  MovieModel.swift
//  TheMovieDBApi
//
//  Created by Сергей Кудинов on 30.11.2021.
//

struct TrendingMovie: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genresIds: [Int]?
    let originalLanguage: String?
    let originalTitle: String?
    let id: Int?
    let voteCount: Int?
    let voteAverage: Double?
    let title: String?
    let overview: String?
    let releaseDate: String?
    let posterPath: String?
    let popularity: Double?
    let mediaType: String?
    
    init(value: [String: Any]) {
        adult = value["adult"] as? Bool
        
        backdropPath = value["backdrop_path"] as? String
        
        genresIds = value["genre_ids"] as? [Int]
        
        originalLanguage = value["original_language"] as? String
        
        originalTitle = value["original_title"] as? String
        
        id = value["id"] as? Int
        
        voteCount = value["vote_count"] as? Int
        
        voteAverage = value["vote_average"] as? Double
        
        title = value["title"] as? String
        
        overview = value["overview"] as? String
        
        releaseDate = value["release_date"] as? String
        
        posterPath = value["poster_path"] as? String
        
        popularity = value["popularity"] as? Double
        
        mediaType = value["media_type"] as? String
    }
    
    static func getRandomUser(from value: Any) -> [TrendingMovie]? {
        guard let value = value as? [String : Any] else { return [] }
        guard let results = value["results"] as? [[String: Any]] else { return [] }
        return results.compactMap { TrendingMovie(value: $0)}
    }

}
