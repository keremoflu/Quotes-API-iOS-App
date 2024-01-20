//
//  QuoteViewModel.swift
//  QuotesBook
//
//  Created by user on 18.11.2023.
//

import Foundation
import SwiftUI
import SwiftData

class QuoteViewModel: ObservableObject {
    
    //Persistence Data
    let defaults = UserDefaults.standard
    
    @Published var category: String = ""
    @Published var isAutoPlayMode: Bool = false
    @Published var autoPlaySeconds: Double = 5.0
    @Published private var sortQuote = SortDescriptor(\FavQuote.quote)
 
    @Published var result = [Quote]()
    @Published var quoteImage : String = ""
    
    func getRandomBackground(category: String) -> String {
        
        //Picking random background image from three choices
            let backgroundFamily = ["family1","family2","family3"]
            let backgroundMoney = ["money1","money2","money3"]
            let backgroundLove = ["love1","love2","love3"]
            let backgroundInspirational =  ["inspirational1","inspirational2","inspirational3"]
            let backgroundFitness = ["fitness1","fitness2","fitness3"]
            let backgroundArt = ["art1","art2","art3"]
            let backgroundBirthday = ["birthday1","birthday2","birthday3"]
            let backgroundSuccess = ["success1","success2","success3"]
            
            switch(category){
            case "family":
                return backgroundFamily.randomElement()!
            case "money":
                return backgroundMoney.randomElement()!
            case "love":
                return backgroundLove.randomElement()!
            case "inspirational":
                return backgroundInspirational.randomElement()!
            case "fitness":
                return backgroundFitness.randomElement()!
            case "art":
                return backgroundArt.randomElement()!
            case "birthday":
                return backgroundBirthday.randomElement()!
            case "success":
                return backgroundSuccess.randomElement()!
            default:
                return "love1"
            }
    }
 
    func toggleAutoPlay(){
        isAutoPlayMode.toggle()
    }
    
    func updateDefaultAutoSeconds(seconds: Double) {
        defaults.set(seconds, forKey: "defaultSeconds")
    }
    
    func isUserSetPreferences() -> Bool {
        
        //Is user launched the app for the first time?
        return defaults.bool(forKey: "defaultFirstSet")
    }
    
    func getDefaultSeconds() -> Double {
        return defaults.double(forKey: "defaultSeconds")
    }
    
    func defaultFirstStart() {
        //We set default system preferences in advance when user launched app for the first time.
        if(!isUserSetPreferences()){
            defaults.set(true, forKey: "defaultFirstSet")
            defaults.set(5.0, forKey: "defaultSeconds")
            defaults.set(true, forKey: "defaultNightMode")
        }
    }
    
    
}

