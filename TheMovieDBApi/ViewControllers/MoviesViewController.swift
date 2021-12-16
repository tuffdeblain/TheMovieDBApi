//
//  TestViewController.swift
//  TheMovieDBApi
//
//  Created by Сергей Кудинов on 15.12.2021.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var topMoviesCollection: UICollectionView!
    @IBOutlet weak var topSerialsCollection: UICollectionView!
    
    private let sectionInserts = UIEdgeInsets(top: 10,
                                      left: 10,
                                      bottom: 10,
                                      right: 10 )
    
    private var trendingMovies: [TrendingMovie?] = []
    private var trendingSerials: [TrendingSerial?] = []
    private var testIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parseTopMoviesData()
        parseTopSerialsData()
        
        topMoviesCollection.showsHorizontalScrollIndicator = false
        topSerialsCollection.showsHorizontalScrollIndicator = false
    }

}
 
extension MoviesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "serialsInfoSegue" {
            if let destination = segue.destination as? MovieTVInfoViewController {
                destination.testText = trendingSerials[testIndex]?.originalName ?? "Error"
            }
        }
        if segue.identifier == "moviesInfoSegue" {
            if let destination = segue.destination as? MovieTVInfoViewController {
                destination.testText = trendingMovies[testIndex]?.originalTitle ?? "Error"
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        testIndex = indexPath.item
        if collectionView == topSerialsCollection {
            performSegue(withIdentifier: "serialsInfoSegue", sender: nil)
        }
        if collectionView == topMoviesCollection {
            performSegue(withIdentifier: "moviesInfoSegue", sender: nil)
        }
        

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == topMoviesCollection {
            return trendingMovies.count
        }
        if collectionView == topSerialsCollection {
            return trendingSerials.count
        } else {
            return 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topMoviesCollection {
            let movieCell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! TopRatedMovieCell
            
            movieCell.getImage(imageURL: URLS.imageURL.rawValue + (trendingMovies[indexPath.item]?.posterPath ?? ""))
            movieCell.movieImage.sizeToFit()
            movieCell.layer.cornerRadius = movieCell.layer.bounds.width / 10
            
            return movieCell
        } else if collectionView == topSerialsCollection {
            let serialCell = collectionView.dequeueReusableCell(withReuseIdentifier: "serialCell", for: indexPath) as! TopRatedSerialsCell
            
            serialCell.getImage(imageURL: URLS.imageURL.rawValue + (trendingSerials[indexPath.item]?.posterPath ?? "/reEMJA1uzscCbkpeRJeTT2bjqUp.jpg"))
            serialCell.layer.cornerRadius = serialCell.layer.bounds.width / 10
            
            return serialCell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidth = sectionInserts.top * (2)
        let avaibleWidth = collectionView.frame.width - paddingWidth
        let widthParItem = avaibleWidth / 3
        let heightParItem = topMoviesCollection.visibleSize.height
        
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
    
    private func parseTopMoviesData() {
        NetworkManager.shared.getFilms(apiKey: "893b48c724a7cc3f08ee94af496ad9c4") { trendingMovies in
            self.trendingMovies = trendingMovies
            
            self.topMoviesCollection.reloadData()
        }
    }
    
    private func parseTopSerialsData() {
        NetworkManager.shared.getSerials(apiKey: "893b48c724a7cc3f08ee94af496ad9c4") { trendingSerials in
            self.trendingSerials = trendingSerials
            
            self.topSerialsCollection.reloadData()
        }
    }
}
