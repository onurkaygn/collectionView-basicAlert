//
//  MovieCell.swift
//  collectionViewProject
//
//  Created by Onuralp Kaygin on 9.06.2023.
//

import UIKit

protocol MovieCellProtocol {
    func addToCart(indexPath: IndexPath)
}

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var moviePrice: UILabel!
    
    var cellProtocol: MovieCellProtocol?
    var indexPath: IndexPath?
    
    @IBAction func addToCart(_ sender: Any) {
        cellProtocol?.addToCart(indexPath: indexPath!)
    }
}
