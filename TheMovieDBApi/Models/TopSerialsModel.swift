//
//  TopSerialsModel.swift
//  TheMovieDBApi
//
//  Created by Сергей Кудинов on 16.12.2021.
//

struct TrendingSerial: Codable {
    let originalCountry: [String]?
    let firstAirDate: String?
    let backdropPath: String?
    let genresIds: [Int]?
    let originalLanguage: String?
    let originalName: String?
    let id: Int?
    let voteCount: Int?
    let voteAverage: Double?
    let name: String?
    let overview: String?
    let posterPath: String?
    let popularity: Double?
    let mediaType: String?
    
    init(value: [String: Any]) {
        originalCountry = value["original_country"] as? [String]
        firstAirDate = value["first_air_date"] as? String
        backdropPath = value["backdrop_path"] as? String
        genresIds = value["genre_ids"] as? [Int]
        originalLanguage = value["original_language"] as? String
        originalName = value["original_name"] as? String
        id = value["id"] as? Int
        voteCount = value["vote_count"] as? Int
        voteAverage = value["vote_average"] as? Double
        name = value["name"] as? String
        overview = value["overview"] as? String
        posterPath = value["poster_path"] as? String
        popularity = value["popularity"] as? Double
        mediaType = value["media_type"] as? String
    }
    
    static func getTopSerials(from value: Any) -> [TrendingSerial]? {
        guard let value = value as? [String : Any] else { return [] }
        guard let results = value["results"] as? [[String: Any]] else { return [] }
        return results.compactMap { TrendingSerial(value: $0)}
    }

}
