//
//  ViewController.swift
//  TheMovieDBApi
//
//  Created by Сергей Кудинов on 30.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    var trendingMovies: [TrendingMovie]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func check() {
        NetworkManager.shared.getFilms(apiKey: "893b48c724a7cc3f08ee94af496ad9c4") { trendingMovies in
            self.trendingMovies = trendingMovies
                        print(self.trendingMovies?.count)
            
        }
        
        ImageManager.shared.getUserImage(from: URLS.imageURL.rawValue + (trendingMovies?[4].posterPath ?? "")) { imageData in
            self.image.image = UIImage(data: imageData)
        }
        
    }
    @IBAction func ауебой(_ sender: Any) {
        
        for index in 0..<(self.trendingMovies?.count ?? 0) {
            print(self.trendingMovies?[index].originalTitle ?? "")
            
        }

    }
}

