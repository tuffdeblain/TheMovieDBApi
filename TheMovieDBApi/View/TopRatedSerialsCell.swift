//
//  TopRatedSerialsCell.swift
//  TheMovieDBApi
//
//  Created by Сергей Кудинов on 16.12.2021.
//

import UIKit

class TopRatedSerialsCell: UICollectionViewCell {
    @IBOutlet weak var serialImage: UIImageView!
    
    func getImage(imageURL: String) {
        ImageManager.shared.getPoster(from: imageURL) { imageData in
            self.serialImage.image = UIImage(data: imageData)
        }
    }
}
