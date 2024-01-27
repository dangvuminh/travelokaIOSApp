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
    var height: CGFloat? = 70
    var width: CGFloat? = 300
    var onTap: () -> Void
    
    init(label: String, @ViewBuilder icon: () -> Icon, searchText: String, height: CGFloat, width: CGFloat, onTap: @escaping () -> Void) {
        self.label = label
        self.icon = icon()
        self.searchText = searchText
        self.height = height
        self.width = width
        self.onTap = onTap
    }
    
    init(label: String, @ViewBuilder icon: () -> Icon, searchText: String, onTap: @escaping () -> Void) {
        self.label = label
        self.icon = icon()
        self.searchText = searchText
        self.onTap = onTap
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
            }.onTapGesture {
                onTap()
            }
        }.frame(width: width, height: height)
    }
}

struct BottomLineControl_Previews: PreviewProvider {
    static var previews: some View {
        BottomLineControl(label: "From", icon: {
            Image(systemName: "airplane")
        }, searchText: "Singapore (SIN)", onTap: { print("Tap tap") })
        
    }
}
