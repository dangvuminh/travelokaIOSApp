//
//  CalendarPannel.swift
//  traveloka
//
//  Created by macbook pro on 29/01/2024.
//

import SwiftUI

struct CalendarPannel: View {
    @State var currentDate = Date()
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("x")
                    Spacer()
                    Text("Pick date")
                    Spacer()
                }
                HStack {
                    VStack {
                        Text("Departure date")
                        Text("Fri, Feb 2nd 2024")
                    }
                    Spacer()
                    VStack {
                        Text("Departure date")
                        Text("Fri, Feb 2nd 2024")
                    }
                }
            }.frame(width: 390, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).background(Color(.sRGB, red:0.02 , green:0.72 ,blue:0.96))
            DatePicker("",selection: $currentDate, in: ...Date(), displayedComponents: .date).labelsHidden().datePickerStyle(GraphicalDatePickerStyle())
            Spacer()
        }.padding()
    }
}

struct CalendarPannel_Previews: PreviewProvider {
    static var previews: some View {
        CalendarPannel()
    }
}
