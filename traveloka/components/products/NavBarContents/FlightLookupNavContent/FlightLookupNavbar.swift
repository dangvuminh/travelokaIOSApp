//
//  FlightLookupNavContent.swift
//  traveloka
//
//  Created by macbook pro on 27/01/2024.
//

import SwiftUI

struct FlightLookupNavbar<Content: View>: View {
    var content: Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        NavbarContainer {
            content
        } title: {
            VStack {
                Text("Flight")
                HStack {
                    Button(action: {}, label: {
                        Text("One way / Return").font(.system(size: 14))
                    }).padding([.all], 5.0).background(Color.white).foregroundColor(Color(.sRGB, red:0.02 , green:0.72 ,blue:0.96)).cornerRadius(7.0)
                    
                    Text("Multiple flights").foregroundColor(.white).padding([.all], 5.0).font(.system(size: 14))
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.white, lineWidth: 2)
                        )
                }
            }
        } prevTitle: {Text("")} rightNav: {
            Image(systemName: "bell").resizable().frame(width: 22, height: 20).foregroundColor(.white)
        }
        
    }
}

struct FlightLookupNavbar_Previews: PreviewProvider {
    static var previews: some View {
        FlightLookupNavbar {
            Text("Flight info")
        }
    }
}
