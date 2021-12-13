//
//  TopRatedMoviesCell.swift
//  TheMovieDBApi
//
//  Created by Сергей Кудинов on 13.12.2021.
//

import UIKit

class TopRatedMoviesCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    
}

extension TopRatedMoviesCell {
    func getImage(imageURL: String) {
        ImageManager.shared.getUserImage(from: imageURL) { imageData in
            self.movieImage.image = UIImage(data: imageData)
        }
    }
}
