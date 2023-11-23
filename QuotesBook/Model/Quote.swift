//
//  Quote.swift
//  QuotesBook
//
//  Created by user on 18.11.2023.
//

import Foundation

struct Quote : Decodable {
    var quote: String
    var author: String
    var category: String
    
    init(quote: String, author: String, category: String) {
        self.quote = quote
        self.author = author
        self.category = category
    }
    
    enum ResponseLoginError: Error {
        case invalidUrl
        case invalidResponse
        case invalidData
    }
    
}
