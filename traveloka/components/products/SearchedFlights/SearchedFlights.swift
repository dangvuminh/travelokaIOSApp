//
//  SearchedFlights.swift
//  traveloka
//
//  Created by macbook pro on 14/01/2024.
//

import SwiftUI

struct SearchedFlights: View {
    var flightCardItems :[FlightCardItem]
    var body: some View {
        VStack {
            Text("Flights you have searched for").font(.system(size: 22.0)).frame(maxWidth: .infinity, alignment: .leading)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(flightCardItems, id: \.self.id) { flight in
                        FlightCard(id: 0, departure: flight.departure, destination: flight.destination, startDate: flight.startDate, endDate: flight.endDate)
                    }
                }
            }
        }.padding()
    }
}

struct SearchedFlights_Previews: PreviewProvider {
    static var previews: some View {
        SearchedFlights(flightCardItems: [])
    }
}
