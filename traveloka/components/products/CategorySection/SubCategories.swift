//
//  SubCategories.swift
//  traveloka
//
//  Created by macbook pro on 09/12/2023.
//

import SwiftUI

struct SubCategorie {
    let icon: String
    let name: String
    let iconWidth: CGFloat
    let iconHeight: CGFloat
    let id: Int
    
    init(icon: String, name: String, id: Int, iconWidth: CGFloat, iconHeight: CGFloat) {
        self.icon = icon
        self.name = name
        self.id = id
        self.iconHeight = iconHeight
        self.iconWidth = iconWidth
    }
}

struct SubCategories: View {
    let subCategories = [
        SubCategorie(icon: "bus.fill", name: "Bus ticket" , id: 0, iconWidth: 23, iconHeight: 27),
        SubCategorie(icon: "key.fill", name: "Vehicle rental" , id: 1, iconWidth: 18, iconHeight: 27),
        SubCategorie(icon: "car.circle", name: "Airport pickup" , id: 2, iconWidth: 27, iconHeight: 27),
        SubCategorie(icon: "building.2.crop.circle.fill", name: "Apartment and villas" , id: 3, iconWidth: 27, iconHeight: 27),
        SubCategorie(icon: "camera", name: "Attractions", id: 4, iconWidth: 25, iconHeight: 23),
        SubCategorie(icon: "figure.wave.circle", name: "Tour" , id: 5, iconWidth: 23, iconHeight: 27),
        SubCategorie(icon: "wifi", name: "Wifi & sim" , id: 6, iconWidth: 27, iconHeight: 24),
        SubCategorie(icon: "ticket.fill", name: "Combo" , id: 8, iconWidth: 25, iconHeight: 27),
        SubCategorie(icon: "airplane.circle", name: "Flight status" , id: 9, iconWidth: 23, iconHeight: 27),
        SubCategorie(icon: "tram.circle.fill", name: "Trains" , id: 10, iconWidth: 27, iconHeight: 27),
        SubCategorie(icon: "bell.circle.fill", name: "Promotion notification" , id: 11, iconWidth: 27, iconHeight: 27),
    ]
    
    func CategoryItem(icon: String, name: String, iconWidth: CGFloat, iconHeight: CGFloat) -> some View {
        VStack {
            Image(systemName: icon).resizable().frame(width: iconWidth, height: iconHeight)
            Text(name).font(.system(size: 14)).frame(width: 75)
        }
        .padding([.all], 7)
    }
    
    let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: columns, spacing: 0, content: {
                ForEach(subCategories, id:\.self.id) { category in
                    CategoryItem(icon: category.icon, name: category.name, iconWidth: category.iconWidth, iconHeight: category.iconHeight)
                }
            })
        }.frame(width: 380, height: 180)
        .padding([.leading], 10.0)
    }
}

struct SubCategories_Previews: PreviewProvider {
    static var previews: some View {
        SubCategories()
    }
}
