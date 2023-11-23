//
//  QuoteView.swift
//  QuotesBook
//
//  Created by user on 18.11.2023.
//

import SwiftUI
import SwiftData

struct QuoteView: View {
    
    @StateObject var quoteVM = QuoteViewModel()
    var category: String
    var quote: String = ""
    @State private var result = [Quote]()
    @State private var quoteImage : String = ""
    
    @State private var showingFavoriteText = false
    
    //Swift Data
    @Environment(\.modelContext) private var context
    @Query(sort: \FavQuote.author) var favQuotes: [FavQuote]
    
    var body: some View {
        ZStack {
            
            Image(quoteImage)
                .resizable()
                .ignoresSafeArea()
                .animation(.easeOut(duration: 0.7))
                
            
            VStack {
                Spacer()
                VStack (alignment: .center){
                    
                    Text(result.first?.quote ?? "")
                        .font(Font.custom(FontsManager.IbarraRealNova.bold, size: 28))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .animation(.easeInOut(duration: 0.7))
                        .task {
                            getQuote()
                        }
                    
                    Text(result.first?.author ?? "")
                        .font(Font.custom(FontsManager.IbarraRealNova.regular, size: 20))
                        .foregroundColor(.white)
                        .padding(.top, 8)
                        .animation(.easeInOut(duration: 0.7))
                    
                }.padding()
                Spacer()
               
                HStack {
                    Spacer()
                    Text(showingFavoriteText ? "Favorited!" : "")
                        .font(.caption)
                        .fontWeight(.light)
                        .foregroundStyle(.white)
                        .animation(.easeInOut(duration: 0.2))
                }.padding(.trailing, 32)
                
                
                HStack (spacing: 32) {
                   
                    Button(""){
                        quoteVM.toggleAutoPlay()
                        runAutoPlayMode()
                    } .buttonStyle(AutoPlayButtonStyle(quoteViewModel: quoteVM))
                    
                    Button("Next"){
                        getQuote()
                       
                        print("ALL ITEMS LISTING; ")
                        //quoteVM.printSavedQuotes()
                    }.buttonStyle(NextButtonStyle())
                        .opacity(quoteVM.isAutoPlayMode ? 0.0 : 1.0)
                
                    Button {
                        print("FAV CLICKED!")
                        
                        runFavoriteAnimation()
                        addToFavorite(item: FavQuote(quote: result.first?.quote ?? "", author: result.first?.author ?? "", category: result.first?.category ?? ""))
                    } label: {
                        Image(systemName: "heart")
                            .font(.largeTitle)
                            .fontWeight(.thin)
                            .foregroundColor(.white)
                    }
                   
                }
                    .padding(.bottom, 32)
            }
           
        }
    }
    
    func runFavoriteAnimation (){
        showingFavoriteText = true
        
        _ = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { timer in
            
            if(showingFavoriteText){
                showingFavoriteText = false
                timer.invalidate()
                print("NEW QUOTE!")
            }else{
                showingFavoriteText = true
            }
        }
        
    }
    
    func addToFavorite(item: FavQuote) {
        
        //simple empty check during quote change
        if(!item.author.isEmpty){
            context.insert(item)
        }
    }
    
     func getQuote() {
         guard let url = URL(string: "\(APIManager.apiUrl)\(category)") else {
             print("invalidURL")
             return
         }
  
         var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
         
         let headers = ["x-api-key":"\(APIManager.apiKey)"]
         request.allHTTPHeaderFields = headers
         request.httpMethod = "GET"
        
         URLSession.shared.dataTask(with: request) { (data, response, error) in
             if let error = error {
                 print("something wrong \(error.localizedDescription)")
                 return
             }
             
             let decoder = JSONDecoder()
             
             if let data = data {
                 
                 do {
                     result = try decoder.decode([Quote].self, from: data)
                 } catch {
                     print(error.localizedDescription)
                    }
                 }
             }
         .resume()
         
         //This view background image sets when first run, we change it when we get second quote
         //Otherwise after fetching quote, image will be set twice at start.
         quoteImage = quoteVM.getRandomBackground(category: category)
     }
     
    
    func runAutoPlayMode(){
        
        let timerSeconds = quoteVM.getDefaultSeconds()
        
        _ = Timer.scheduledTimer(withTimeInterval: timerSeconds, repeats: true) { timer in
            
            if(quoteVM.isAutoPlayMode){
                getQuote()
                print("NEW QUOTE!")
            }else{
                timer.invalidate()
            }
        }
        
    }
    
    
    
    
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(quoteVM: QuoteViewModel(), category: "")
    }
}
