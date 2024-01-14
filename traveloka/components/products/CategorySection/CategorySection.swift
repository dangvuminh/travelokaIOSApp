//
//  CategorySection.swift
//  traveloka
//
//  Created by macbook pro on 07/12/2023.
//

import SwiftUI

struct CategorySection: View {
    
    let tabs = [TabBarItem(tabName: "Promotions", tabId: "tab1", active: true), TabBarItem(tabName: "For you", tabId: "tab2", active: false)]
    let carousels = [CarouselItem(id: 0, imgUrl: "promotionBanner1", linkTo: ""), CarouselItem(id: 1, imgUrl: "promotionbanner2", linkTo: ""), CarouselItem(id: 2, imgUrl: "promotionBanner3", linkTo: ""),
                     CarouselItem(id: 3, imgUrl: "promotionBanner4", linkTo: "")
    ]
    
    var body: some View {
        VStack {
            MainCategories()
            Rectangle().fill(Color(red: 0.85, green: 0.85, blue: 0.85)).frame(width: .infinity, height: 1.5)
            SubCategories()
            TabBarContainer(tabs: tabs, tabContents: [AnyView(Carousel(carouselItems: carousels)), AnyView(Text("For you"))])
            Spacer()
        }.padding([.top], 20)
    }
}

struct CategorySection_Previews: PreviewProvider {
    static var previews: some View {
        CategorySection()
    }
}
