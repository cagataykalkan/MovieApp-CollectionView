//
//  Movies.swift
//  MovieApp
//
//  Created by Çağatay KALKAN on 3.07.2024.
//

import Foundation

class Movies{
    var id:Int?
    var name:String?
    var image:String?
    var price:Int?
    
    init(id: Int, name: String, image: String, price: Int) {
        self.id = id
        self.name = name
        self.image = image
        self.price = price
    }
    init(){
        
    }
}
