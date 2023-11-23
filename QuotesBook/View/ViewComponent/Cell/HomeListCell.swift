//
//  HomeListCell.swift
//  QuotesBook
//
//  Created by user on 18.11.2023.
//

import SwiftUI

struct HomeListCell: View {
    
    var image: String
    var category: String
    
    var body: some View {
        ZStack (alignment: .bottomLeading){
            Image(image)
                .resizable()
               
                .cornerRadius(16)
                .overlay{
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.black)
                        .opacity(0.3)
                }
            
                Text(category)
                    .foregroundColor(.white)
                    .font(Font.custom(FontsManager.GentiumBookPlus.bold, size: 18))
                    .padding(10)
            
        } .frame(width: 180, height: 120)
        
    }

}



struct HomeListCell_Previews: PreviewProvider {
    static var previews: some View {
        HomeListCell(image: "money", category: "Money")
    }
}
