//
//  FlightSearch.swift
//  traveloka
//
//  Created by macbook pro on 27/01/2024.
//

import SwiftUI

struct FlightSearch: View {
    @Binding var popoverOpen: Bool
    @Binding var dataChanged: String
    init(popoverOpen: Binding<Bool>, dataChanged: Binding<String>) {
        self._popoverOpen = popoverOpen
        self._dataChanged = dataChanged
    }
    
    private func CityAirportItem(city: String, country: String, airport: String, airportCode: String) -> some View {
        VStack {
            HStack {
                Text("\(city), \(country)").font(.system(size: 15.0)).frame(maxWidth: .infinity, alignment: .leading)
            }
            Text("\(airportCode) - \(airport)").font(.system(size: 12.0)).foregroundColor(.gray).frame(maxWidth: .infinity, alignment: .leading)
        }.onTapGesture {
            dataChanged = "\(city) (\(airportCode))"
            popoverOpen = false
        }
    }
    var body: some View {
        VStack {
            HStack {
                SearchField(searchText: "")
                Text("Cancel").font(.system(size: 14.0)).foregroundColor(.white)
            }.padding().frame(width: .infinity, height: 50).background(Color(.sRGB, red:0.02 , green:0.72 ,blue:0.96)).onTapGesture {
                popoverOpen = false
            }
            HStack {}
            Text("Recent search").padding().font(.system(size: 15.0)).frame(maxWidth: .infinity,maxHeight: 30.0, alignment: .leading).background(Color(red: 0.93, green: 0.93, blue: 0.93))
                List {
                    CityAirportItem(city: "TP HCM", country: "Viet Nam", airport: "Tan Son Nhat airport", airportCode: "SGN")
                    CityAirportItem(city: "Taipei", country: "Taiwan", airport: "Taoyuan airport", airportCode: "TPE")
                    CityAirportItem(city: "Hong Kong", country: "Hong Kong", airport: "Hong Kong Intl airport", airportCode: "HKG")
                    CityAirportItem(city: "Dalat", country: "Viet Nam", airport: "Lien Khuong airport", airportCode: "DLI")
                }.frame(height: 170.0)
            Text("Popular cities or airports").padding().font(.system(size: 15.0)).frame(maxWidth: .infinity,maxHeight: 30.0, alignment: .leading).background(Color(red: 0.93, green: 0.93, blue: 0.93))
                List {
                    CityAirportItem(city: "Tokyo", country: "Japan", airport: "Hanaeda airport", airportCode: "HND")
                    CityAirportItem(city: "New York", country: "The US", airport: "John F.KKenedy", airportCode: "JFK")
                    CityAirportItem(city: "Istanbul", country: "Turkey", airport: "Ataturk airport", airportCode: "IST")
                    CityAirportItem(city: "Sydney", country: "Taiwan", airport: "Sydney airport", airportCode: "SYD")
                }
            Spacer()
        }
    }
}

struct FlightSearch_Previews: PreviewProvider {
    @State static var popoverOpen: Bool = false
    @State static var dataChanged: String = ""
    static var previews: some View {
        FlightSearch(popoverOpen: $popoverOpen, dataChanged: $dataChanged)
    }
}
