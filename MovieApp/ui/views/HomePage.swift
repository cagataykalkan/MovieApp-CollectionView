//
//  ViewController.swift
//  MovieApp
//
//  Created by Çağatay KALKAN on 3.07.2024.
//

import UIKit

class HomePage: UIViewController {
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    var movieList = [Movies]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesCollectionView.dataSource = self
        moviesCollectionView.delegate = self
        
        let m1 = Movies(id: 1, name: "Django", image: "django", price: 24)
        let m2 = Movies(id: 2, name: "Interstellar", image: "interstellar", price: 32)
        let m3 = Movies(id: 3, name: "Inception", image: "inception", price: 16)
        let m4 = Movies(id: 4, name: "The Hateful Eight", image: "thehatefuleight", price: 28)
        let m5 = Movies(id: 5, name: "The Pianist", image: "thepianist", price: 18)
        let m6 = Movies(id: 6, name: "Anadoluda", image: "anadoluda", price: 10)
        
        movieList.append(m1)
        movieList.append(m2)
        movieList.append(m3)
        movieList.append(m4)
        movieList.append(m5)
        movieList.append(m6)
        
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10 )
        design.minimumInteritemSpacing = 10
        design.minimumLineSpacing = 10
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 30) / 2
        
        design.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.6 + 8)
        
        moviesCollectionView.collectionViewLayout = design
    }
}

extension HomePage : UICollectionViewDelegate, UICollectionViewDataSource, cellProtocol {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = movieList[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.movieImageView.image = UIImage(named: movie.image!)
        cell.moviePriceLabel.text = "\(movie.price!) ₺"
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.4
        cell.layer.cornerRadius = 12.5
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movieList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: movie)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let movie = sender as? Movies{
                let destinationVC = segue.destination as! DetailPage
                destinationVC.movie = movie
            }
        }
    }
    
    func addToBasketButton(indexPath: IndexPath) {
        let movie = movieList[indexPath.row]
        print("\(movie.name!) added")
    }
}


