//
//  Home.swift
//  traveloka
//
//  Created by macbook pro on 02/12/2023.
//

import SwiftUI

struct Home: View {
    let cardItems = [ CardItem(id: 0,img: "gardenByTheBay", price: "999.999 VND",newPrice: "899.999 VND", location: "Singapore", name: "Garden by the bay"),
                      CardItem(id: 1,img: "shangrila", price: "2.399.999 VND",newPrice: "1.799.999 VND", location: "Manila", name: "Shangrila Hotel Manila"), CardItem(id: 2,img: "gyeongbokgung", price: "1.099.999 VND",newPrice: "799.999 VND", location: "Seoul", name: "Gyeongbokgung Palace"),CardItem(id: 3,img: "taipei101", price: "651.235 VND",newPrice: "504.899 VND", location: "Taipei", name: "Taipei 101")]
    var flightCardItems = [FlightCardItem(id: 0,departure: "SGN", destination: "SIN", startDate: "Mon Feb 5", endDate: "Mon Feb 9"), FlightCardItem(id: 1,departure: "SIN", destination: "ICN", startDate: "Tue May 13", endDate: "Tue May 20"), FlightCardItem(id: 2,departure: "TPE", destination: "HKG", startDate: "Tue May 13", endDate: "Wed May 14")]
    
    var body: some View {
        ScrollView(.vertical) {
            CategorySection()
            SearchedItems(cardItems: cardItems)
            SearchedFlights(flightCardItems: flightCardItems)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
