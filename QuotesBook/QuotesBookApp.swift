//
//  QuotesBookApp.swift
//  QuotesBook
//
//  Created by user on 18.11.2023.
//

import SwiftUI
import SwiftData

@main
struct QuotesBookApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: FavQuote.self)
    }
}


//Credit: All photos: pexels.com
//API Used: https://api-ninjas.com/api/quotes
