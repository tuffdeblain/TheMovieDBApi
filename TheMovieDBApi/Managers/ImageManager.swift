//
//  ImageManager.swift
//  TheMovieDBApi
//
//  Created by Сергей Кудинов on 01.12.2021.
//

import Alamofire

class ImageManager {
    
    static let shared = ImageManager()
    
    private init() {}
    
    func getUserImage(from url: String, completion: @escaping (Data) -> Void) {
        AF.request(url)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let imageData):
                    completion(imageData)
                case .failure(let error):
                    print(error)
                }
        }
    }
}
