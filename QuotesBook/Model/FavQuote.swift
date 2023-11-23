//
//  FavQuote.swift
//  QuotesBook
//
//  Created by user on 21.11.2023.
//

import Foundation
import SwiftData

@Model
class FavQuote {
    var quote: String
    var author: String
    var category: String
    
    init(quote: String, author: String, category: String) {
        self.quote = quote
        self.author = author
        self.category = category
    }
    
}
