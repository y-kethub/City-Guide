//
//  ContentView.swift
//  City Guide
//
//  Created by developer on 2022/12/21.
//

import SwiftUI

struct ContentView: View {
    @State var tabSelection = 1
    var body: some View {
        TabView(selection: $tabSelection) {
            TopView().tabItem {
                VStack {
                    Image(systemName: "map.fill")
                    Text("トップ")
                }
            }.tag(1)
            ClipView().tabItem {
                VStack {
                    Image(systemName: "bookmark.fill")
                    Text("クリップ")
                }
            }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
