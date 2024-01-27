//
//  LookupFlightPage.swift
//  traveloka
//
//  Created by macbook pro on 25/01/2024.
//

import SwiftUI

struct LookupFlightPage: View {
    let maxScreenWidth = UIScreen.main.bounds.width
    let maxScreenHeight = UIScreen.main.bounds.height
    var body: some View {
        ZStack {
            VStack{}.frame(width: maxScreenWidth, height: maxScreenHeight).background(Color(red: 0.93, green: 0.93, blue: 0.93))
            VStack{}.frame(width: maxScreenWidth, height: 100.0).background(Color(.sRGB, red:0.02 , green:0.72 ,blue:0.96)).padding([.bottom], 540.0)
            FlightLookupNavbar {
                FlightSearchPannel().padding([.top], 15).background(Color.white).frame(width: 370, height: 750, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(10.0)
            }.padding([.top], 30)
        }
    }
}

struct LookupFlightPage_Previews: PreviewProvider {
    static var previews: some View {
        LookupFlightPage()
    }
}
