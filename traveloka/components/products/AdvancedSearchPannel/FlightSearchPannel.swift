//
//  Flights.swift
//  traveloka
//
//  Created by macbook pro on 25/01/2024.
//

import SwiftUI

struct DataSearched {
    var from: String;
    var to: String;
    var departTime: Date;
    var returnTime: Date;
    var numOfPassengers: PassengerNumbers;
    // enum soon
    var seatType: String;
    
    init() {
        self.from = "";
        self.to = "";
        self.departTime = Date();
        self.returnTime = Date();
        self.numOfPassengers = PassengerNumbers(adult: 1, child: 0, infant: 0, adultPos: 0, childPos: 0, infantPos: 0);
        self.seatType = "";
    }
    
    init(from: String, to: String, departTime: Date, returnTime: Date, numOfPassengers: PassengerNumbers, seatType: String) {
        self.from = from;
        self.to = to;
        self.departTime = departTime;
        self.returnTime = returnTime;
        self.numOfPassengers = numOfPassengers;
        self.seatType = seatType;
    }
}

struct FlightSearchPannel: View {
    @State var isReturned = false
    @State var popoverOpen1 = false
    @State var popoverOpen2 = false
    @State var popoverOpen3 = false
    @State var popoverOpen4 = false
    @State var popoverOpen5 = false
    @State var searchedData: DataSearched = DataSearched(from: "TP HCM (SGN)" , to: "Singapore (SIN)", departTime: Date(), returnTime: Date().addingTimeInterval(86400), numOfPassengers: PassengerNumbers(adult: 1, child: 0, infant: 0, adultPos: 0, childPos: 0, infantPos: 0), seatType: "Economy")

    var body: some View {
        VStack {
            ZStack {
                BottomLineControl(label: "From", icon: {
                    Image(systemName: "airplane")
                }, searchText: searchedData.from, onTap: {
                    popoverOpen1 = true
                }).popover(isPresented: $popoverOpen1, content: {
                    FlightSearch(popoverOpen: $popoverOpen1, dataChanged: $searchedData.from)
                })
                Image(systemName: "arrow.up.arrow.down.circle.fill").resizable().frame(width: 30, height: 30).padding(EdgeInsets(.init(top: 25, leading: 300.0, bottom: 0, trailing: 0))).foregroundColor(.blue).onTapGesture {
                    let temp = searchedData.to;
                    searchedData.to = searchedData.from;
                    searchedData.from = temp;
                }
            }
            BottomLineControl(label: "To", icon: {
                Image(systemName: "airplane")
            }, searchText: searchedData.to, onTap: {
                popoverOpen2 = true
            }).popover(isPresented: $popoverOpen2, content: {
                FlightSearch(popoverOpen: $popoverOpen2, dataChanged: $searchedData.to)
            })
            
            ZStack {
                BottomLineControl(label: "Departure time", icon: {
                    Image(systemName: "calendar")
                }, searchText: dateFormatterToString(date: searchedData.departTime, format: "dd/MM/yyyy"), onTap: {
                    popoverOpen3 = true
                }).popover(isPresented: $popoverOpen3, content: {
                    CalendarPannel(popoverOpen: $popoverOpen3, dataChanged: $searchedData.departTime)
                })
                VStack {
                    Text("Return?").padding([.leading], 250).font(.system(size: 13.0))
                    Toggle("", isOn: $isReturned).padding([.bottom,.trailing], 45)
                }
            }
            if isReturned == true {
                BottomLineControl(label: "Return time", icon: {
                    Image(systemName: "calendar")
                }, searchText: dateFormatterToString(date: searchedData.returnTime, format: "dd/MM/yyyy"), onTap: {
                    popoverOpen4 = true
                }).popover(isPresented: $popoverOpen4, content: {
                    CalendarPannel(popoverOpen: $popoverOpen4, dataChanged: $searchedData.returnTime)
                })
            }
            HStack {
                BottomLineControl(label: "Number of passengers", icon: {
                    Image(systemName: "person.2")
                }, searchText: "\(searchedData.numOfPassengers.adult + searchedData.numOfPassengers.child + searchedData.numOfPassengers.infant) passenger(s)", height: 80, width: 160, onTap: {popoverOpen5 = true}).sheet(isPresented: $popoverOpen5, content: {
                    AddPassengerPannel(popoverOpen: $popoverOpen5,dataChanged: $searchedData.numOfPassengers)
                })
                BottomLineControl(label: "Seat type", icon: {
                    Image(systemName: "studentdesk")
                }, searchText: searchedData.seatType, height: 70, width: 160, onTap: {
                    popoverOpen5 = true
                })
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
