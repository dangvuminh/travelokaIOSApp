//
//  NavBar.swift
//  traveloka
//
//  Created by macbook pro on 02/12/2023.
//

import SwiftUI

struct Navbar<Label: View, PrevLabel: View, RightNav: View> : View {
    let title: Label;
    var prevTitle: PrevLabel?
    var rightNav: RightNav?
    @Environment(\.presentationMode) var presentationMode;
    @State var destination: AnyView?
    @State var clickItem: Int? = 0
    init(@ViewBuilder title: () -> Label, @ViewBuilder prevTitle: () -> PrevLabel, @ViewBuilder rightNav: () -> RightNav) {
        self.title = title()
        self.prevTitle = prevTitle()
        self.rightNav = rightNav()
    }
    var body: some View {
        HStack {
            NavigationLink(
                destination: self.destination,
                tag: 1,
                selection: $clickItem
            ){}
            if PrevLabel.self != EmptyView.self {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName:  "arrow.left")
                    prevTitle.font(.system(size: 12))
                })}
            Spacer()
            title
            Spacer()
            rightNav
        }
        .padding()
        .background(Color(.sRGB, red:0.02 , green:0.72 ,blue:0.96).ignoresSafeArea())
        .accentColor(.white)
    }
}

struct Navbar_Previews: PreviewProvider {
    static var previews: some View {
        Navbar {
            Text("AAA")
        } prevTitle: {
            Text("BBBB")
        } rightNav: {
            Text("CCCC")
        }
        
    }
}
