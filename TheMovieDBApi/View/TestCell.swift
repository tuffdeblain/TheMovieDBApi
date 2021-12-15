//
//  TestCell.swift
//  TheMovieDBApi
//
//  Created by Сергей Кудинов on 15.12.2021.
//

import UIKit

class TestCell: UICollectionViewCell {
    @IBOutlet weak var movieImage: UIImageView!
    func getImage(imageURL: String) {
        ImageManager.shared.getUserImage(from: imageURL) { imageData in
            self.movieImage.image = UIImage(data: imageData)
        }
    }
}
