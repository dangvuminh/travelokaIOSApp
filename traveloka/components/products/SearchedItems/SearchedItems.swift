//
//  SearchedItems.swift
//  traveloka
//
//  Created by macbook pro on 13/01/2024.
//

import SwiftUI

struct SearchedItems: View {
    var cardItems: [CardItem]
    var body: some View {
        VStack {
            Text("You have searched")
            ScrollView(.horizontal) {
                HStack {
                    ForEach(cardItems, id: \.self.id) { item in
                        Card(id: item.id, img: item.img, price: item.price, newPrice: item.newPrice, location: item.location, name: item.name)
                    }
                }
            }
        }.padding()
    }
}
