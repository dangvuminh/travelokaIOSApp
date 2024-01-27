//
//  NavBarContainer.swift
//  traveloka
//
//  Created by macbook pro on 02/12/2023.
//

import SwiftUI

struct NavbarContainer<Content: View, Label: View, PrevLabel: View, RightNav: View>: View {
    let content : Content
    let title: Label
    let prevTitle: PrevLabel
    let rightNav: RightNav
    init(@ViewBuilder content: () -> Content, @ViewBuilder title: () -> Label, @ViewBuilder prevTitle: () -> PrevLabel, @ViewBuilder rightNav: () -> RightNav) {
        self.content = content()
        self.title = title()
        self.prevTitle = prevTitle()
        self.rightNav = rightNav()
    }
    var body: some View {
        VStack(spacing: 0) {
            Navbar {
                title
            } prevTitle: {
                prevTitle
            } rightNav: {rightNav}
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct NavbarContainer_Previews: PreviewProvider {
    static var previews: some View {
        NavbarContainer(content: {
            ZStack {
                Color.green.ignoresSafeArea()
                Text("Helloss")
            }
        }, title:
            {
                Text("AAAAA")
            }
        , prevTitle: {
            Text("BBBBB")
        }, rightNav: {
            Text("CCCC")
        }
        )
    }
}
