//
//  FavoriteListSheet.swift
//  QuotesBook
//
//  Created by user on 21.11.2023.
//

import SwiftUI
import SwiftData

struct FavoriteListSheet: View {
    
    //Swift Data
    @Environment(\.modelContext) private var context
    @Query(sort: \FavQuote.author) var favQuotes: [FavQuote]
    
    var body: some View {
        VStack {
            
            List {
                
                ForEach (favQuotes){ item in
                    FavoriteListCell(quote: item.quote, author: item.author, category: item.category.capitalized)
                }.onDelete { indexes in
                    for index in indexes {
                        deleteItem(favQuotes[index])
                    }
                }
                
                Text(favQuotes.isEmpty ? "There is no favorited quote yet." : "Drag Left to Delete")
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundStyle(.gray, .gray)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
           
        }
    }
    
    func deleteItem(_ item:FavQuote) {
        context.delete(item)
    }
}

#Preview {
    FavoriteListSheet()
}
