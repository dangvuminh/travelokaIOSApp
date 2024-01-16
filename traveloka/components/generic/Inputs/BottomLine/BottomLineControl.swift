//
//  SeaarchControl.swift
//  traveloka
//
//  Created by macbook pro on 16/01/2024.
//

import SwiftUI

struct BottomLineControl<Icon: View>: View {
    var label: String
    var icon: Icon
    var searchText: String
    
    init(label: String, @ViewBuilder icon: () -> Icon, searchText: String) {
        self.label = label
        self.icon = icon()
        self.searchText = searchText
    }
    var body: some View {
        VStack {
            Text(label).frame(maxWidth: .infinity, alignment: .leading).font(.system(size: 14.5)).foregroundColor(.gray)
            ZStack {
                HStack {
                    icon.padding([.bottom], 30)
                    Spacer()
                }
                HStack {
                    Text(searchText).padding([.bottom, .leading], 30)
                    Spacer()
                }
                Divider()
            }
        }.frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
}

struct BottomLineControl_Previews: PreviewProvider {
    static var previews: some View {
        BottomLineControl(label: "From", icon: {
            Image(systemName: "airplane")
        }, searchText: "Singapore (SIN)")
        
    }
}
