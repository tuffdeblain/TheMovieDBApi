//
//  MovieTVInfoViewController.swift
//  TheMovieDBApi
//
//  Created by Сергей Кудинов on 17.12.2021.
//

import UIKit

class MovieTVInfoViewController: UIViewController {
    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var originalNameLabel: UILabel!
    @IBOutlet weak var localizedNameLabel: UILabel!
    
    var isMovie = false
    var trendingMovies: TrendingMovie?
    var trendingSerials: TrendingSerial? 
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
    }
}

extension MovieTVInfoViewController {
    private func getBackDropImage(path: String) {
        ImageManager.shared.getPoster(from: URLS.imageURL.rawValue + path) { backdropData in
                self.backdropImage.image = UIImage(data: backdropData)
        }
        backdropImage.layer.cornerRadius = backdropImage.frame.height / 25
        
    }
    
    private func checkArray() -> Bool{
        if trendingMovies != nil {
            return true
        } else {
            return false
        }
    }
    
    private func setUpView() {
        isMovie = checkArray()
        
        if isMovie {
            getBackDropImage(path: trendingMovies?.backdropPath ?? "")
            originalNameLabel.text = trendingMovies?.originalTitle
            localizedNameLabel.text = trendingMovies?.title
        } else {
            getBackDropImage(path: trendingSerials?.backdropPath ?? "")
            originalNameLabel.text = trendingSerials?.originalName
            localizedNameLabel.text = trendingSerials?.name
        }
    }
}
