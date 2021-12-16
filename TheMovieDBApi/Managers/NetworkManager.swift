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
                    guard let results = TrendingMovie.getTopMovies(from: value) else { return }
                    completion(results)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func getSerials(apiKey: String, completion: @escaping ([TrendingSerial]) -> Void) {
        AF.request(URLS.mainURL.rawValue + URLS.trendingSerialsPath.rawValue + apiKey)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let results = TrendingSerial.getTopSerials(from: value) else { return }
                    completion(results)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
