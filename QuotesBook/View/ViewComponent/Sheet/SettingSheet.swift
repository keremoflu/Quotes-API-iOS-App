//
//  SettingSheet.swift
//  QuotesBook
//
//  Created by user on 19.11.2023.
//

import SwiftUI

struct SettingSheet: View {
    
    @State var seconds: Double = 5
    
    @StateObject var quoteVM = QuoteViewModel()
    
    var body: some View {
        VStack {
            
            ZStack(alignment: .top) {
                
                Spacer()
                
                VStack {
                    Text("Set Auto Play Second")
                        .font(.caption)
                        .foregroundColor(Color("themeSettingText"))
                        .fontWeight(.light)
                        .padding(.bottom,4)
                    
                    Text(String(Int(seconds)))
                        .font(Font.custom(FontsManager.IbarraRealNova.bold, size: 24))
                        .foregroundStyle(Color("themeSettingText"))
                    
                    Slider(value: $seconds, in: 5...30, step: 5) { editing in
                        quoteVM.updateDefaultAutoSeconds(seconds: seconds)
                        print(quoteVM.getDefaultSeconds())
                        seconds = quoteVM.getDefaultSeconds()
                    }
                    
                }.padding(20)
                    .cornerRadius(20)
                    .padding(.horizontal)
                
                Spacer()
            }
            
        }
    }
    
    struct SettingSheet_Previews: PreviewProvider {
        static var previews: some View {
            SettingSheet()
        }
    }
}
