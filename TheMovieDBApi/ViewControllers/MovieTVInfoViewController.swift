//
//  MovieTVInfoViewController.swift
//  TheMovieDBApi
//
//  Created by Сергей Кудинов on 17.12.2021.
//

import UIKit

class MovieTVInfoViewController: UIViewController {
    private var trendingMovies: [TrendingMovie?] = []
    private var trendingSerials: [TrendingSerial?] = []
    var testText = ""
    
    @IBOutlet weak var testLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        testLabel.text = testText
    }
}
