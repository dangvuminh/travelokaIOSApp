//
//  TabBarContainer.swift
//  traveloka
//
//  Created by macbook pro on 07/01/2024.
//

import SwiftUI

struct TabBarContainer: View {
    var tabs: [TabBarItem]
    var tabContents: [AnyView]
    @State var tabIdClicked: Int
    
    init(tabs: [TabBarItem], tabContents: [AnyView]) {
        self.tabs = tabs
        self.tabContents = tabContents
        self.tabIdClicked = 0
    }
    var body: some View {
        VStack {
            TabBar(tabs: tabs, tabIdClicked: $tabIdClicked).padding([.leading, .trailing], 15.0).overlay(Rectangle().fill(Color.gray).frame(height: 0.5).shadow(color: .gray, radius: 2, y: 2), alignment: .bottom)
            
            //----Tab Contents-------
            ForEach(0..<tabContents.count) { index in
                if tabIdClicked == index {
                    tabContents[index]
                }
            }
        }
    }
}

struct TabBarContainer_Previews: PreviewProvider {
    static let tabs = [TabBarItem(tabName: "Tab 1", tabId: "tab1", active: false), TabBarItem(tabName: "Tab 2", tabId: "tab2", active: true)]
    
    static var previews: some View {
        TabBarContainer(tabs: tabs, tabContents: [AnyView(Text("AAAA"))])
    }
}
