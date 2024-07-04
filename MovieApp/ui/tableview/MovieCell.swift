//
//  MovieCell.swift
//  MovieApp
//
//  Created by Çağatay KALKAN on 4.07.2024.
//

import UIKit
protocol cellProtocol {
    func addToBasketButton(indexPath: IndexPath)
}

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var moviePriceLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    var cellProtocol:cellProtocol?
    var indexPath:IndexPath?
    
    
    @IBAction func addToBasketPressed(_ sender: Any) {
        cellProtocol?.addToBasketButton(indexPath: indexPath!)
    }
    
}
