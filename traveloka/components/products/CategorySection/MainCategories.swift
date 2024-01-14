//
//  MainCategories.swift
//  traveloka
//
//  Created by macbook pro on 09/12/2023.
//

import SwiftUI

struct MainCategories: View {
    
    func CategoryItem(icon: String, name: String) -> some View {
        VStack {
            Image(systemName: icon).resizable()
                .frame(width: 35.0, height: 35.0)
            Text(name).font(.system(size: 15.0))
        }
    }
    
    var body: some View {
        HStack {
            Spacer()
            CategoryItem(icon: "airplane.circle", name: "Flights")
            Spacer()
            Spacer()
            CategoryItem(icon: "building.2", name: "Hotels")
            Spacer()
            Spacer()
            CategoryItem(icon: "x.circle", name: "Xperience")
            Spacer()
        }
    }
}

struct MainCategories_Previews: PreviewProvider {
    static var previews: some View {
        MainCategories()
    }
}
