//
//  AutoPlayButtonStyle.swift
//  QuotesBook
//
//  Created by user on 19.11.2023.
//

import SwiftUI

struct AutoPlayButtonStyle: ButtonStyle {
    
    var quoteViewModel : QuoteViewModel
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            
            Image(systemName:quoteViewModel.isAutoPlayMode ? "stop" : "play")
                .font(.body)
                .fontWeight(.light)
                .foregroundColor(.white)
                .padding(14)
        }.background(
            RoundedRectangle(cornerRadius: 100).stroke(.white, lineWidth: 1)
        )
       
    }
    
}
