//
//  TestViewController.swift
//  TheMovieDBApi
//
//  Created by Сергей Кудинов on 15.12.2021.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var testCollection: UICollectionView!
    private var trendingMovies: [TrendingMovie?] = []
    let sectionInserts = UIEdgeInsets(top: 20,
                                      left: 10,
                                      bottom: 20,
                                      right: 10 )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseData()
        testCollection.showsVerticalScrollIndicator = false
        testCollection.showsHorizontalScrollIndicator = false
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
 
extension TestViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        trendingMovies.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ayeCell", for: indexPath) as! TestCell
        
        cell.getImage(imageURL: URLS.imageURL.rawValue + (trendingMovies[indexPath.item]?.posterPath ?? ""))
        cell.movieImage.sizeToFit()
        cell.layer.cornerRadius = cell.layer.bounds.width / 25
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingWidth = sectionInserts.top * (2)
        let avaibleWidth = collectionView.frame.width - paddingWidth
        let widthParItem = avaibleWidth / 3
        let heightParItem = widthParItem * 1.5
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
            
            self.testCollection.reloadData()
        }
    }
}
