//
//  ScrollListView.swift
//  City Guide
//
//  Created by developer on 2022/12/22.
//

import SwiftUI

struct ScrollListView: View {
    var title = ""
    var body: some View {
        HStack {
            Text(title)
                .padding([.top, .leading, .trailing])
                .font(.title3)
                .bold()
            Spacer()
        }
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                CardView()
                CardView()
                CardView()
            }.padding(.all, 10.0)
        }
    }
}

struct ScrollListView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollListView()
    }
}
