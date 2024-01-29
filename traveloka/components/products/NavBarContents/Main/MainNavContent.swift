//
//  MainNavContent.swift
//  traveloka
//
//  Created by macbook pro on 03/12/2023.
//

import SwiftUI

struct MainNavContent: View {
    @State var searchText: String = ""
    
    var body: some View {
        SearchField(searchText: searchText)
    }
}

struct MainNavContent_Previews: PreviewProvider {
    static var previews: some View {
        MainNavContent()
    }
}
