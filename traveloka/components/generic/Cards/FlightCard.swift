//
//  FlightCard.swift
//  traveloka
//
//  Created by macbook pro on 14/01/2024.
//

import SwiftUI

struct FlightCardItem {
    var id: Int
    var departure: String
    var destination: String
    var startDate: String;
    var endDate: String;
}

struct FlightCard: View {
    var id: Int
    var departure: String
    var destination: String
    var startDate: String;
    var endDate: String;
    init(id: Int,departure: String, destination: String ,startDate: String, endDate: String ) {
        self.id = id
        self.departure = departure
        self.destination = destination
        self.startDate = startDate
        self.endDate = endDate
    }
    var body: some View {
        ZStack {
            Image("curvedBlueWave2").resizable().frame(width: 130, height: 50).padding(EdgeInsets(top: 52.0, leading: 100, bottom: 0, trailing: 0))
            HStack {
                HStack {}.frame(width: 3, height: 78, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).background(Color(.sRGB, red:0.02 , green:0.72 ,blue:0.96)).padding([.trailing], 1.0)
                VStack {
                    HStack {
                        Text(departure).font(.system(size: 13))
                        Image(systemName: "arrow.forward")
                        Text(destination).font(.system(size: 13))
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(startDate) - \(endDate)").frame(maxWidth: .infinity, alignment: .leading).font(.system(size: 12)).foregroundColor(.gray)
                }
                Image(systemName: "airplane").foregroundColor(Color(.sRGB, red:0.02 , green:0.72 ,blue:0.96)).padding(EdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 5))
            }
        }.frame(width: 220, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding([ .trailing, .leading], 7)
    }
}

struct FlightCard_Previews: PreviewProvider {
    static var previews: some View {
        FlightCard(id: 0, departure: "SGN", destination: "SIN", startDate: "Mon Feb 5", endDate: "Mon Feb 9")
    }
}
