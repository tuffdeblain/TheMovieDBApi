//
//  TestViewController.swift
//  TheMovieDBApi
//
//  Created by Сергей Кудинов on 15.12.2021.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var testCollection: UICollectionView!
    
    private let sectionInserts = UIEdgeInsets(top: 10,
                                      left: 10,
                                      bottom: 10,
                                      right: 10 )
    
    private var trendingMovies: [TrendingMovie?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parseData()
        testCollection.showsVerticalScrollIndicator = false
        testCollection.showsHorizontalScrollIndicator = false
    }

}
 
extension MoviesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        trendingMovies.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ayeCell", for: indexPath) as! TopRatedMovieCell
        
        cell.getImage(imageURL: URLS.imageURL.rawValue + (trendingMovies[indexPath.item]?.posterPath ?? ""))
        cell.movieImage.sizeToFit()
        cell.layer.cornerRadius = cell.layer.bounds.width / 10
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingWidth = sectionInserts.top * (2)
        let avaibleWidth = collectionView.frame.width - paddingWidth
        let widthParItem = avaibleWidth / 3
        let heightParItem = testCollection.visibleSize.height
        
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
    
    private func parseData() {
        NetworkManager.shared.getFilms(apiKey: "893b48c724a7cc3f08ee94af496ad9c4") { trendingMovies in
            self.trendingMovies = trendingMovies
            
            self.testCollection.reloadData()
        }
    }
}
