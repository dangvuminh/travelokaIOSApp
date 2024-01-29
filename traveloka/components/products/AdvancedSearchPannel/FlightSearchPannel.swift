//
//  Flights.swift
//  traveloka
//
//  Created by macbook pro on 25/01/2024.
//

import SwiftUI

struct FlightSearchPannel: View {
    @State var isReturned = false
    @State var popoverOpen1 = false
    @State var popoverOpen2 = false
    var body: some View {
        VStack {
            ZStack {
                BottomLineControl(label: "From", icon: {
                    Image(systemName: "airplane")
                }, searchText: "Singapore (SIN)", onTap: {
                    popoverOpen1 = true
                }).popover(isPresented: $popoverOpen1, content: {
                     FlightSearch()
                })
                Image(systemName: "arrow.up.arrow.down.circle.fill").resizable().frame(width: 30, height: 30).padding(EdgeInsets(.init(top: 25, leading: 300.0, bottom: 0, trailing: 0))).foregroundColor(.blue)
            }
            BottomLineControl(label: "To", icon: {
                Image(systemName: "airplane")
            }, searchText: "Beijing (BEIA)", onTap: {
                popoverOpen1 = true
            })
            
            ZStack {
                BottomLineControl(label: "Departure time", icon: {
                    Image(systemName: "calendar")
                }, searchText: "02/02/2024", onTap: {
                    popoverOpen2 = true
                }).popover(isPresented: $popoverOpen2, content: {
                    CalendarPannel()
               })
                VStack {
                    Text("Return?").padding([.leading], 250).font(.system(size: 13.0))
                    Toggle("", isOn: $isReturned).padding([.bottom,.trailing], 45)
                }
            }
            BottomLineControl(label: "Return time", icon: {
                Image(systemName: "calendar")
            }, searchText: "04/02/2024", onTap: {
                popoverOpen2 = true
            })
            HStack {
                BottomLineControl(label: "Number of passengers", icon: {
                    Image(systemName: "person.2")
                }, searchText: "1 passenger", height: 80, width: 160, onTap: {print("Tap")})
                BottomLineControl(label: "Seat type", icon: {
                    Image(systemName: "studentdesk")
                }, searchText: "1 passenger", height: 70, width: 160, onTap: {print("Tap")})
            }
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Search").foregroundColor(.white)
            }).frame(width: 350, height: 40, alignment: .center).background(Color.init(red: 1, green: 0.38, blue: 0.27)).cornerRadius(5.0)
            Spacer()
        }
    }
}

struct FlightSearchPannel_Previews: PreviewProvider {
    static var previews: some View {
        FlightSearchPannel()
    }
}
