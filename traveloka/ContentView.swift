//
//  ContentView.swift
//  traveloka
//
//  Created by macbook pro on 02/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Main()
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
