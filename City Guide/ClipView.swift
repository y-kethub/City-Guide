//
//  ClipView.swift
//  City Guide
//
//  Created by developer on 2022/12/22.
//

import SwiftUI

struct ClipView: View {
    var body: some View {
        ScrollView {
            HStack {
                Text("クリップ")
                    .font(.largeTitle)
                .fontWeight(.bold)
                .padding(10)
                Spacer()
            }
            VStack {
                ClipCardView()
                ClipCardView()
                ClipCardView()
                ClipCardView()
                ClipCardView()
                ClipCardView()
            }
        }
    }
}

struct ClipView_Previews: PreviewProvider {
    static var previews: some View {
        ClipView()
    }
}
