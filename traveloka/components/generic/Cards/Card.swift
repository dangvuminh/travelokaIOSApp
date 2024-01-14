//
//  Card.swift
//  traveloka
//
//  Created by macbook pro on 13/01/2024.
//

import SwiftUI

struct CardItem {
    var id: Int
    var img: String
    var price: String
    var newPrice: String
    var location: String
    var name: String
}

struct Card: View {
    var id: Int
    var img: String
    var price: String
    var newPrice: String
    var location: String
    var name: String
    
    init(id: Int,img: String,price: String,newPrice: String,location: String,name: String) {
        self.id = id
        self.img = img
        self.price = price
        self.newPrice = newPrice
        self.location = location
        self.name = name
    }
    var body: some View {
        ZStack {
            VStack {
                Image(img).resizable()
                VStack {
                    Text(name).font(.system(size: 14.0))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 0, leading: 3, bottom: 1, trailing: 0))
                    Text(price).font(.system(size: 13.0)).frame(maxWidth: .infinity, alignment: .leading).padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                    Text(newPrice).font(.system(size: 15.0)).frame(maxWidth: .infinity, alignment: .leading).padding(EdgeInsets(top: 0, leading: 5, bottom: 15, trailing: 0)).foregroundColor(.orange)
                }
            }.frame(width: 150, height: 170).cornerRadius(5.0)
            Image(systemName: "bookmark").resizable().frame(width: 17, height: 20).padding(EdgeInsets(top: 0, leading: 115.0, bottom: 130, trailing: 0)).foregroundColor(.white)
            ZStack {
                HStack{}.padding().frame(width: 120).background(Color.black.opacity(0.3))
                HStack {
                    Image(systemName: "mappin.and.ellipse").foregroundColor(.white)
                    Text(location).foregroundColor(.white).font(.system(size: 14.0))
                }
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 130, trailing: 40))
        }.border(Color(red: 240, green: 240, blue: 240)).shadow(color: .gray, radius: 2,x: 2, y: 2)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(id: 0,img: "gardenByTheBay", price: "999.999",newPrice: "899.999", location: "Singapore", name: "Garden by the bay")
    }
}
