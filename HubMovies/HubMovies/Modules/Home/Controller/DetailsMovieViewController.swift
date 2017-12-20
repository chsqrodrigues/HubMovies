//
//  DetailsMovieViewController.swift
//  HubMovies
//
//  Created by Carlos Henrique Siqueira Rodrigues on 20/12/17.
//  Copyright © 2017 Carlos Henrique Siqueira Rodrigues. All rights reserved.
//

import UIKit

class DetailsMovieViewController: HubMoviesBaseViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genereLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: MovieDTO!
    var generes: [ValuesDTO]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        // Do any additional setup after loading the view.
    }
    
    func setupView() {
        self.title = movie.title
        self.titleLabel.text = movie.title
        
        self.overviewLabel.text = movie.overview
        
        if let posterPath = movie.posterPath {
            self.loadImagePoster(posterPath, imageView: posterImageView, width: 500)
        }
        
        if let backdropPath = movie.backdropPath {
            self.loadImagePoster(backdropPath, imageView:coverImageView, width: 1280)
        }
        
        if let releaseDate = movie.releaseDate {
            self.releaseDateLabel.text = StringFormatter.formatDateToString(releaseDate)
        }
        
        self.genereLabel.text = String()
        
        for genreId in movie.genreIds! {
            let filter =  generes.filter { $0.id == genreId }
            
            if filter.count > 0 {
                if genereLabel.text?.count == 0 {
                    self.genereLabel.text = filter[0].name
                } else {
                    self.genereLabel.text = "\(self.genereLabel.text ?? ""), \(filter[0].name ?? "")"
                }
            }
            
        }
    }
    
    func loadImagePoster(_ endPointImg: String, imageView: UIImageView, width: Int){
        let url = URL(string: String.init(format: URLHelper.getEndpoint("baseUrlGetImage") + endPointImg, width))
        imageView.kf.setImage(with: url)
    }
    
    
}

