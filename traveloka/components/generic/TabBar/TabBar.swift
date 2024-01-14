//
//  TabBar.swift
//  traveloka
//
//  Created by macbook pro on 10/12/2023.
//

import SwiftUI

struct TabBarItem {
    let tabName: String
    let tabId: String
    var active: Bool
    
    init(tabName: String, tabId: String, active: Bool) {
        self.tabName = tabName
        self.tabId = tabId
        self.active = active
    }
}

struct TabBar: View {
    @State var tabs: [TabBarItem];
    @Binding var tabIdClicked: Int
    var dynamicTabBarWidth: CGFloat
    
    init(tabs: [TabBarItem], tabIdClicked: Binding<Int>) {
        self.tabs = tabs
        //The underscrore of tabIdClicked is to open the binding so we can change the value
        self._tabIdClicked = tabIdClicked
        dynamicTabBarWidth = UIScreen.main.bounds.width / CGFloat(tabs.count)
    }
    
    var body: some View {
            HStack {
                //make sure each tabId is unique
                ForEach(0..<tabs.count) { index in
                    VStack {
                        Button(action: {
                            tabs[index].active = true
                            tabIdClicked = index
                            for (id, tab) in tabs.enumerated() {
                                if(tab.tabId != tabs[index].tabId) {
                                    tabs[id].active = false
                                }
                            }
                        }, label: {
                            Text(tabs[index].tabName)
                        }).frame(width: dynamicTabBarWidth - CGFloat((dynamicTabBarWidth * 15.0) / 100.0), height: 30.0)
                        .overlay(
                            ZStack {
                                if tabs[index].active == true {
                                    RoundedRectangle(cornerRadius: 25).fill(Color.blue)
                                    Text(tabs[index].tabName).foregroundColor(.white)
                                } else {
                                    Text(tabs[index].tabName).foregroundColor(.gray)
                                }
                            }.allowsHitTesting(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                        )
                        if tabs[index].active == true {
                            Rectangle().fill(Color.blue)
                                .frame(minWidth: dynamicTabBarWidth, maxHeight: 3).padding([.top], 2.0)
                        }
                    }
                }
            }
    }
}

struct TabBar_Previews: PreviewProvider {
    static let tabs = [TabBarItem(tabName: "Tab 1", tabId: "tab1", active: false), TabBarItem(tabName: "Tab 2", tabId: "tab2", active: true)]
    @State static var tabIdClicked = 0
    static var previews: some View {
        TabBar(tabs: tabs, tabIdClicked: $tabIdClicked)
    }
}
