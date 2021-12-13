//
//  TopRatedMoviesViewController.swift
//  TheMovieDBApi
//
//  Created by Сергей Кудинов on 13.12.2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class TopRatedMoviesViewController: UICollectionViewController {

    private var trendingMovies: [TrendingMovie?] = []
    let sectionInserts = UIEdgeInsets(top: 20,
                                      left: 20,
                                      bottom: 20,
                                      right: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseData()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        trendingMovies.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moviieCell", for: indexPath) as! TopRatedMoviesCell

        
        cell.layer.cornerRadius = cell.layer.bounds.width / 25
        cell.backgroundColor = .red
        cell.movieImage.image = UIImage(imageLiteralResourceName: "questionPerson")
        cell.getImage(imageURL: URLS.imageURL.rawValue + (self.trendingMovies[indexPath.item]?.posterPath ?? ""))

        return cell
    }



}

extension TopRatedMoviesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingWidth = sectionInserts.top * (3)
        let avaibleWidth = collectionView.frame.width - paddingWidth
        let widthParItem = avaibleWidth / 2
        let heightParItem = widthParItem * 1.5
        print(heightParItem)
        return CGSize(width: widthParItem, height: heightParItem)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sectionInserts.top,
                            left: sectionInserts.left,
                            bottom: sectionInserts.bottom,
                            right: sectionInserts.right)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sectionInserts.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sectionInserts.right
    }
    
    func parseData() {
        NetworkManager.shared.getFilms(apiKey: "893b48c724a7cc3f08ee94af496ad9c4") { trendingMovies in
            self.trendingMovies = trendingMovies
            
            self.collectionView.reloadData()
        }
    }
    
    
    
    
}
