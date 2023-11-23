//
//  ContentView.swift
//  QuotesBook
//
//  Created by user on 18.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    @StateObject var quoteVM = QuoteViewModel()
    
    @State private var searchText: String = ""
    
    @State private var isShowingSettings = false
    @State private var isShowingFavorites = false
    
    let adaptiveColumns = [
        GridItem(.adaptive(minimum: 180))
    ]
    
    var body: some View {
        VStack {
            
            NavigationStack {
                
                ScrollView {
                    
                    LazyVGrid(columns: adaptiveColumns, alignment: .center, spacing: 10) {
                        
                        ForEach(viewModel.searchedList(text: searchText), id: \.self) { index in
                            
                            NavigationLink (destination: QuoteView(category: index.category), label: {
                                HomeListCell(image: index.image, category: index.category.capitalized)
                            })
                            
                        }
                    }
                    .padding(.all, 10)
                    
                } .toolbar{
                    
                    HStack {
                        
                        Spacer()
                        
                        Button {
                            isShowingFavorites.toggle()
                            
                        } label: {
                            Image(systemName: "heart")
                                .font(.body)
                                .tint(Color("themeHomeIcon"))
                        }.sheet(isPresented: $isShowingFavorites, content: {
                            FavoriteListSheet()
                                .presentationDetents([.fraction(0.5)])
                        })
                        Button{
                            isShowingSettings.toggle()
                            
                        } label: {
                           
                                Image(systemName: "gearshape")
                                    .font(.body)
                                    .tint(Color("themeHomeIcon"))
                           
                        }.sheet(isPresented: $isShowingSettings) {
                            SettingSheet()
                                .presentationDetents([.fraction(0.3)])
                        }
                    }
                }
                
                
            }.tint(.black)
                .searchable(text: $searchText, prompt: "Search category")
            
        }.onAppear {
            quoteVM.defaultFirstStart()
        }
    }
    
}

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }



