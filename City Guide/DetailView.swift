//
//  DetailView.swift
//  City Guide
//
//  Created by developer on 2022/12/23.
//

import SwiftUI

struct DetailView: View {
    @State var imageURL = "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Souffe_pancakes_%2876651%29.jpg/360px-Souffe_pancakes_%2876651%29.jpg"
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image.resizable()
                            .frame(height: 250)
                            .scaledToFit()
                    } placeholder: {
                        LoadingView(width:UIScreen.main.bounds.width, height: 250)
                    }
                    .frame(height: 250)
                    LinearGradient(gradient: Gradient(colors: [Color.clear, Color.clear, Color.black]), startPoint: .top, endPoint: .bottom)
                        .frame(height: 250)
                    VStack {
                        Spacer()
                        HStack {
                            if true {
                                Text("CAFE BROWN")
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.white)
                            } else {
                                LoadingView(width: 140, height: 50)
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.white)
                            }
                            Spacer()
                        }
                    }
                    
                    Text("スフレパンケーキが人気のお店。ゆったりと過ごせる雰囲気。電源、Wi-Fiあり")
                    
                    //contents
                }
            }
        }
        .statusBarHidden()
        .ignoresSafeArea()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
