//
//  CardView.swift
//  City Guide
//
//  Created by developer on 2022/12/22.
//

import SwiftUI

struct CardView: View {
    @State var clip = false
    var title = "CAFE BROWN"
    var caption = "スフレパンケーキが人気のお店"
    var imageURL = "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Souffe_pancakes_%2876651%29.jpg/360px-Souffe_pancakes_%2876651%29.jpg"
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image.resizable()
                            .frame(width: 150, height: 100)
                            .scaledToFill()
                    } placeholder: {
                        LoadingView(width: 150, height: 100)
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
                Text(title)
                    .padding([.leading, .bottom, .trailing], 10.0)
                    .frame(width: 150, height: 25)
            }
            .onTapGesture(count: 2) {
                clip = true
                let feedbackGenerator = UINotificationFeedbackGenerator()
                feedbackGenerator.notificationOccurred(.success)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    clip = false
                }
            }
            .frame(width: 150, height: 125)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(Color("CardColor"))
                
            )
            .cornerRadius(5)
            .shadow(color: .black.opacity(0.5), radius: 5)
            if clip {
                Color.accentColor.opacity(0.5)
                Image(systemName: "bookmark.fill")
                    .resizable()
                    .scaledToFit()
                    .padding(.all, 40.0)
                    .foregroundColor(.white)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
