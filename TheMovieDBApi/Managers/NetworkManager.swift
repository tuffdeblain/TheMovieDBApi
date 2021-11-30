//
//  NetworkManager.swift
//  TheMovieDBApi
//
//  Created by Сергей Кудинов on 30.11.2021.
//

import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func getFilms(_ completion: @escaping ([TrendingMovie]) -> Void) {
        AF.request(
    }
}
