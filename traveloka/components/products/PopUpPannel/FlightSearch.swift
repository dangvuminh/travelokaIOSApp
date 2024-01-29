//
//  FlightSearch.swift
//  traveloka
//
//  Created by macbook pro on 27/01/2024.
//

import SwiftUI

struct FlightSearch: View {
    private func CityAirportItem(city: String, airport: String) -> some View {
        VStack {
            Text(city).font(.system(size: 15.0)).frame(maxWidth: .infinity, alignment: .leading)
            Text(airport).font(.system(size: 12.0)).foregroundColor(.gray).frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    var body: some View {
        VStack {
            HStack {
                SearchField(searchText: "")
                Text("Cancel").font(.system(size: 14.0)).foregroundColor(.white)
            }.padding().frame(width: .infinity, height: 50).background(Color(.sRGB, red:0.02 , green:0.72 ,blue:0.96))
            HStack {}
            Text("Recent search").padding().font(.system(size: 15.0)).frame(maxWidth: .infinity,maxHeight: 30.0, alignment: .leading).background(Color(red: 0.93, green: 0.93, blue: 0.93))
                List {
                    CityAirportItem(city: "Ho Chi Minh city, Viet Nam", airport: "SGN - Tan Son Nhat airport")
                    CityAirportItem(city: "Taipei, Taiwan", airport: "TPE - Taoyuan airport")
                    CityAirportItem(city: "Hong Kong, Hong Kong", airport: "SGN - Hong Kong Intl airport")
                    CityAirportItem(city: "Da Lat, Viet Nam", airport: "DLI - Lien Khuong Nhat airport")
                }.frame(height: 170.0)
            Text("Popular cities or airports").padding().font(.system(size: 15.0)).frame(maxWidth: .infinity,maxHeight: 30.0, alignment: .leading).background(Color(red: 0.93, green: 0.93, blue: 0.93))
                List {
                    CityAirportItem(city: "Tokyo, Japan", airport: "HND - Hanaeda aiport")
                    CityAirportItem(city: "NewYork, The US", airport: "JFK - John F.Kenedy airport")
                    CityAirportItem(city: "Istanbul, Turkey", airport: "All airports")
                    CityAirportItem(city: "Sydney, Australia", airport: "SYD - Sydney airport")
                }
            Spacer()
        }
    }
}

struct FlightSearch_Previews: PreviewProvider {
    static var previews: some View {
        FlightSearch()
    }
}
