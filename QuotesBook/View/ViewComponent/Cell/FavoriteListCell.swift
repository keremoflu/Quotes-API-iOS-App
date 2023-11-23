//
//  FavoriteListCell.swift
//  QuotesBook
//
//  Created by user on 21.11.2023.
//

import SwiftUI

struct FavoriteListCell: View {
    
    var quote: String
    var author: String
    var category: String
    
    var body: some View {
        VStack {
            Text(quote)
            
            HStack {
                
                Spacer()
                Text(author)
                    .font(.caption2)
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 100)
                            .fill(.black))
                
                Text(category)
                    .font(.caption2)
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 100)
                            .fill(.cyan))
                    
            }
        }.padding()
    }
}

#Preview {
    FavoriteListCell(quote: "The best and most beautiful things in the world cannot be seen or even touched - they must be felt with the heart",author: "Albert Einstein",category: "success")
}
