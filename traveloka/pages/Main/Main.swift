//
//  Main.swift
//  traveloka
//
//  Created by macbook pro on 13/01/2024.
//

import SwiftUI

struct Main: View {
    var body: some View {
        NavbarContainer {
            VStack {
                TabView {
                    Home().tabItem { Label("Home", systemImage: "house") }
                    Text("Explore").tabItem { Label("Explore", systemImage: "play.circle") }
                    Text("My booking").tabItem { Label("My booking", systemImage: "list.bullet.rectangle") }
                    Text("Saved").tabItem { Label("Saved", systemImage: "doc.on.clipboard.fill") }
                    Text("My account").tabItem { Label("My account", systemImage: "person") }
                }
            }
        } title: {
            MainNavContent()
        } prevTitle: {
            EmptyView()
        } rightNav: {
            HStack {
                Image(systemName: "bell").resizable().frame(width: 25, height:25).foregroundColor(.white)
                Image(systemName: "bubble.left.and.bubble.right").resizable().frame(width: 18, height:16).foregroundColor(.white)
            }
            
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
