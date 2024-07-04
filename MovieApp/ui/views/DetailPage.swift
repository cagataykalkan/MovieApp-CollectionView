//
//  DetailPage.swift
//  MovieApp
//
//  Created by Çağatay KALKAN on 3.07.2024.
//

import UIKit

class DetailPage: UIViewController {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameLAbel: UILabel!
    @IBOutlet weak var moviePriceLabel: UILabel!
    
    
    var movie:Movies?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let m = movie {
            movieImageView.image = UIImage(named: m.image!)
            nameLAbel.text = m.name
            moviePriceLabel.text = "\(m.price!) ₺"
        }
        
      
    }
    

    

}
