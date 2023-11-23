//
//  NextButtonStyle.swift
//  QuotesBook
//
//  Created by user on 18.11.2023.
//

import SwiftUI

struct NextButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .font(Font.custom(FontsManager.Montserrat.light, size: 24))
                .foregroundColor(.white)
                
            
            Image(systemName: "chevron.right")
                .font(Font.custom(FontsManager.Montserrat.light, size: 16))
                .foregroundColor(.white)
                .opacity(0.8)
            
        }.padding(8)
            .padding(.horizontal, 36)
        .background(
            RoundedRectangle(cornerRadius: 100).stroke(.white, lineWidth: 1)
        ).animation(.easeOut).scaleEffect(configuration.isPressed ? 0.9 : 1)
            .opacity(configuration.isPressed ? 0.5 : 1)
            
    }
    
}

