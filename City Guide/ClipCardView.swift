//
//  ClipCardView.swift
//  City Guide
//
//  Created by developer on 2022/12/22.
//

import SwiftUI

struct ClipCardView: View {
    var title = "CAFE BROWN"
    var caption = "スフレパンケーキが人気のお店"
    var imageURL = "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Souffe_pancakes_%2876651%29.jpg/360px-Souffe_pancakes_%2876651%29.jpg"
    var body: some View {
        HStack {
            ZStack {
                AsyncImage(url: URL(string: imageURL)) { image in
                    image.resizable()
                        .frame(width: 150, height: 125)
                        .scaledToFill()
                } placeholder: {
                    LoadingView(width: 150, height:125)
                }
                VStack {
                    Spacer()
                    HStack{
                        Spacer()
                        if true {
                            Circle()
                                .frame(width: 30, height: 30)
                                .padding(5)
                                .foregroundColor(.yellow)
                                .overlay() {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.white)
                                }
                        } else if false {
                            Circle()
                                .frame(width: 30, height: 30)
                                .padding(5)
                                .foregroundColor(.orange)
                                .overlay() {
                                    Image(systemName: "tag.fill")
                                        .foregroundColor(.white)
                                }
                        }
                    }
                }
            }
            VStack(alignment: .leading) {
                Text(title)
                    .bold()
                Text(caption)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.all, 5)
            .frame(width: 197, height: 125)
        }
        .frame(width: 347, height: 125)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(Color("CardColor"))
            
        )
        .cornerRadius(5)
        .shadow(color: .black.opacity(0.5), radius: 5)
        .padding([.leading, .bottom, .trailing], 10.0)
    }
}

struct ClipCardView_Previews: PreviewProvider {
    static var previews: some View {
        ClipCardView()
    }
}
