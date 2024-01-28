//
//  SearchField.swift
//  traveloka
//
//  Created by macbook pro on 28/01/2024.
//

import SwiftUI

struct SearchField: View {
    @State var searchText: String
    var body: some View {
        HStack {
            HStack {
                ZStack {
                    TextField("", text: $searchText)
                        .frame(width: 80.0, height: 35.0)
                        .textFieldStyle(PlainTextFieldStyle())
                        .background(RoundedRectangle(cornerRadius: 5.0))
                        .foregroundColor(.white)
                        .padding([.top, .bottom], -12)
                    Image(systemName: "magnifyingglass").foregroundColor(.gray).background(Color.white)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 35.0))
                }
                TextField("Find your products, destinations..", text: $searchText)
                    .frame(width: 250, height: 35)
                    .textFieldStyle(PlainTextFieldStyle())
                    .background(RoundedRectangle(cornerRadius: 5.0))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: -45, bottom: 0, trailing: 12))
            }
        }
    }
}

struct SearchField_Previews: PreviewProvider {
    static var previews: some View {
        SearchField(searchText: "")
    }
}
