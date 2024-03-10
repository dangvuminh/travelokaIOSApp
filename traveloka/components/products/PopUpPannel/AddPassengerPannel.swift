//
//  AddPassengerPannel.swift
//  traveloka
//
//  Created by macbook pro on 04/03/2024.
//

import SwiftUI
func renderDialNumber(type: String) -> some View {
    if type == "adult" {
        return ForEach(1..<7) { id in
            Text("\(id)").tag(id).font(.system(size: 18))
        }
    } else if type == "child" {
        return ForEach(0..<6) { id in
            Text("\(id)").tag(id).font(.system(size: 18))
        }
    }
    return ForEach(0..<4) { id in
        Text("\(id)").tag(id).font(.system(size: 18))
    }
}
struct PassengerNumbers {
    var adult: Int;
    var child: Int;
    var infant: Int;
    var adultPos: Int;
    var childPos: Int;
    var infantPos: Int;
}
struct AddPassengerPannel: View {
    @Binding var dataChanged: PassengerNumbers
    @Binding var popoverOpen: Bool
    @State var selectedValue: PassengerNumbers
    init(popoverOpen: Binding<Bool>, dataChanged: Binding<PassengerNumbers>) {
        self._dataChanged = dataChanged
        self._popoverOpen = popoverOpen
        self.selectedValue = dataChanged.wrappedValue
    }
    var body: some View {
        VStack {
            Text("Add passenger")
            Divider()
            HStack {
                Spacer()
                VStack {
                    Text("Adult").font(.system(size: 15))
                    Text("Above 12").font(.system(size: 12)).foregroundColor(.gray)
                }
                Spacer()
                VStack {
                    Text("Child").font(.system(size: 15))
                    Text("From 2 to 11").font(.system(size: 12)).foregroundColor(.gray)
                }
                Spacer()
                VStack {
                    Text("Infant").font(.system(size: 15))
                    Text("Under 2").font(.system(size: 12)).foregroundColor(.gray)
                }
                Spacer()
            }
            ZStack {
                HStack {}.frame(width: UIScreen.main.bounds.width, height: 35.0).background(Color(.sRGB, red:0.94 , green:0.94 ,blue:0.94))
                HStack {
                    Spacer()
                    Picker(selection: $selectedValue.adultPos, label: Text("Picker"), content: {
                        renderDialNumber(type: "adult")
                    }).background(Color.white).frame(width: 70.0, height: 100.0).clipped()
                    Spacer()
                    Picker(selection: $selectedValue.childPos, label: Text("Picker"), content: {
                        renderDialNumber(type: "child")
                    }).background(Color.white).frame(width: 70.0, height: 100.0).clipped()
                    Spacer()
                    Picker(selection: $selectedValue.infantPos, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/, content: {
                        renderDialNumber(type: "infant")
                    }).background(Color.white).frame(width: 70.0, height: 100.0).clipped()
                    Spacer()
                }
            }
            Divider()
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Cancel")
                }).frame(width: 180, height: 35).background(Color(.sRGB, red:0.94 , green:0.94 ,blue:0.94)).cornerRadius(5.0)
                Button(action: {
                    var temp = selectedValue;
                    temp.adult = selectedValue.adultPos + 1;
                    temp.child = selectedValue.childPos;
                    temp.infant = selectedValue.infantPos;
                    dataChanged = temp
                    popoverOpen = false
                }, label: {
                    Text("Confirm").foregroundColor(.white)
                }).frame(width: 180, height: 35).background(Color(.sRGB, red:0.02 , green:0.72 ,blue:0.96)).cornerRadius(5.0)
            }
        }
    }
}

struct AddPassengerPannel_Previews: PreviewProvider {
    @State static var dataChanged: PassengerNumbers = PassengerNumbers(adult: 1, child: 0, infant: 0, adultPos: 0, childPos: 0, infantPos: 0)
    @State static var popoverOpen: Bool = false
    static var previews: some View {
        AddPassengerPannel(popoverOpen: $popoverOpen, dataChanged: $dataChanged)
    }
}
