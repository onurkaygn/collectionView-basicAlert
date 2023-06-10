//
//  ViewController.swift
//  collectionViewProject
//
//  Created by Onuralp Kaygin on 9.06.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var moviesList = [Movies]()
    override func viewDidLoad() {
        super.viewDidLoad()
            
        let design: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let width = self.collectionView.frame.size.width
        
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        design.minimumLineSpacing = 10
        design.minimumLineSpacing = 10
        
        let cellWidth = (width - 30) / 2
        
        design.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.65)
        
        collectionView!.collectionViewLayout = design

        collectionView.delegate = self
        collectionView.dataSource = self
        
        let m0 = Movies(movieId: 0, movieName: "Django", movieImageName: "django", moviePrice: 15.99)
        let m1 = Movies(movieId: 1, movieName: "Inception", movieImageName: "inception", moviePrice: 15.99)
        let m2 = Movies(movieId: 2, movieName: "Interstaller", movieImageName: "interstellar", moviePrice: 15.99)
        let m3 = Movies(movieId: 3, movieName: "Anadoluda", movieImageName: "birzamanlaranadoluda", moviePrice: 15.99)
        let m4 = Movies(movieId: 4, movieName: "The Hateful Eight", movieImageName: "thehatefuleight", moviePrice: 15.99)
        let m5 = Movies(movieId: 5, movieName: "The Pianist", movieImageName: "thepianist", moviePrice: 15.99)
        
        moviesList.append(m0)
        moviesList.append(m1)
        moviesList.append(m2)
        moviesList.append(m3)
        moviesList.append(m4)
        moviesList.append(m5)
    }


}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,MovieCellProtocol {
    func addToCart(indexPath: IndexPath) {
        let movie = moviesList[indexPath.row]
        let alertController = UIAlertController(title: "🛒", message: "\(movie.movieName!) added to cart", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default) {
        action in
        print("Okay Clicked")
    }
        alertController.addAction(okayAction)
        
        self.present(alertController,animated: true)
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = moviesList[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCell
        
        cell.movieName.text = movie.movieName
        cell.moviePrice.text = "\(movie.moviePrice!)€"
        cell.imageView.image = UIImage(named: movie.movieImageName!)
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
        
        cell.layer.borderColor = UIColor(red: 55/255, green: 48/255, blue: 107/255, alpha: 1.0).cgColor
        cell.layer.borderWidth = 1
        return cell
        
    }
}
