//
//  Home.swift
//  traveloka
//
//  Created by macbook pro on 02/12/2023.
//

import SwiftUI

struct Home: View {
    let cardItems = [ CardItem(id: 0,img: "gardenByTheBay", price: "999.999 VND",newPrice: "899.999 VND", location: "Singapore", name: "Garden by the bay"),
                      CardItem(id: 1,img: "shangrila", price: "2.399.999 VND",newPrice: "1.799.999 VND", location: "Philipines", name: "Shangrila Hotel Manila")]
    var body: some View {
        ScrollView(.vertical) {
            CategorySection()
            SearchedItems(cardItems: cardItems)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
