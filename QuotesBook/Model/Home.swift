//
//  Home.swift
//  QuotesBook
//
//  Created by user on 18.11.2023.
//

import Foundation

struct Home : Identifiable, Hashable {
    var id: UUID = UUID()
    var category: String
    var image: String
    
    init(category: String, image: String) {
        self.category = category
        self.image = image
    }
    
    static var testList = [
        Home(category: "family", image: "family"),
        Home(category: "money", image: "money"),
        Home(category: "love", image: "love"),
        Home(category: "inspirational", image: "inspirational"),
        Home(category: "fitness", image: "fitness"),
        Home(category: "art", image: "art"),
        Home(category: "birthday", image: "birthday"),
        Home(category: "success", image: "success")
        
    ]
}
