//
//  ContentViewModel.swift
//  QuotesBook
//
//  Created by user on 19.11.2023.
//

import Foundation

class ContentViewModel: ObservableObject {
    func searchedList (text:String) -> [Home] {
        if(text.isEmpty){
            return Home.testList
        }else {
            return Home.testList.filter{$0.category.localizedCaseInsensitiveContains(text)}
        }
    }
}
