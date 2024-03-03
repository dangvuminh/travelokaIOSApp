//
//  CalendarPannel.swift
//  traveloka
//
//  Created by macbook pro on 29/01/2024.
//

import SwiftUI

struct CalendarPannel: View {
    @State var pickedDate = Date()
    @Binding var popoverOpen: Bool
    @Binding var dataChanged: Date
    init(popoverOpen: Binding<Bool>, dataChanged: Binding<Date>) {
        self._popoverOpen = popoverOpen
        self._dataChanged = dataChanged
    }
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Image(systemName: "xmark").padding([.leading], 15.0).foregroundColor(.white).onTapGesture {
                        popoverOpen = false
                    }
                    Spacer()
                    Text("Pick date").foregroundColor(.white)
                    Spacer()
                }.padding([.bottom], 10)
                HStack {
                    VStack {
                        Text("Departure date").font(.system(size: 12.0)).foregroundColor(.white).padding([.trailing], 50.0)
                        HStack {
                            Text(dateFormatterToString(date: pickedDate, format: nil)).font(.system(size: 15.0)).padding(EdgeInsets(.init(top: 5.0, leading: 15.0, bottom: 5.0, trailing: 15.0))).foregroundColor(.white).background(Color(.sRGB, red: 0.27, green: 0.78, blue: 1)).cornerRadius(7.0)
                        }.padding([.leading], 12.0)
                    }
                    Spacer()
                    VStack {
                        Text("Departure date").font(.system(size: 12.0)).foregroundColor(.white).padding([.trailing], 75.0)
                        HStack {
                            Text("Fri, Feb 2nd 2024").font(.system(size: 15.0)).foregroundColor(.white).padding(EdgeInsets(.init(top: 5.0, leading: 15.0, bottom: 5.0, trailing: 15.0))).background(Color(.sRGB, red: 0.27, green: 0.78, blue: 1)).cornerRadius(7.0)
                        }.padding([.trailing], 12.0)
                    }
                }
            }.frame(width: 390, height: 120).background(Color(.sRGB, red:0.02 , green:0.72 ,blue:0.96))
            DatePicker("",selection: $pickedDate, in: Date()..., displayedComponents: .date).labelsHidden().datePickerStyle(GraphicalDatePickerStyle())
                .frame(width: 360, height: 330)
                .onChange(of: pickedDate, perform: { value in
                    popoverOpen = false
                    dataChanged = value
                })
            Spacer()
        }
    }
}

struct CalendarPannel_Previews: PreviewProvider {
    @State static var popoverOpen: Bool = false
    @State static var dataChanged: Date = Date()
    static var previews: some View {
        CalendarPannel(popoverOpen: $popoverOpen, dataChanged: $dataChanged)
    }
}
