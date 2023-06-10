//
//  Movies.swift
//  collectionViewProject
//
//  Created by Onuralp Kaygin on 9.06.2023.
//

import Foundation

class Movies {
    var movieId: Int?
    var movieName: String?
    var movieImageName: String?
    var moviePrice: Double?
    
    init() {
        
    }
    
    init(movieId: Int, movieName: String, movieImageName: String, moviePrice: Double) {
        self.movieId = movieId
        self.movieName = movieName
        self.movieImageName = movieImageName
        self.moviePrice = moviePrice
    }
    
}
