//
//  NetworkManager.swift
//  TheMovieDBApi
//
//  Created by Сергей Кудинов on 30.11.2021.
//

import Alamofire
import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func getFilms(apiKey: String, completion: @escaping ([TrendingMovie]) -> Void) {
        AF.request(URLS.mainURL.rawValue + URLS.trendingMoviesPath.rawValue + apiKey)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let results = TrendingMovie.getRandomUser(from: value) else { return }
                    completion(results)
                case .failure(_):
                    print("fuck")
                }
            }
    }
}
