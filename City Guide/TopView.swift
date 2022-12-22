//
//  TopView.swift
//  City Guide
//
//  Created by developer on 2022/12/21.
//

import SwiftUI
import CoreLocation

struct TopView: View {
    @ObservedObject  var manager = LocationManager()
    @State var imageURL = "https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Tokyo_Station_Marunouchi_Building_P5228787.jpg/1920px-Tokyo_Station_Marunouchi_Building_P5228787.jpg"
    @State var dateinfo = Date()
    @State var date = ""
    @State var time = ""
    private let dateFormatter = DateFormatter()
    private let timeFormatter = DateFormatter()
    init() {
        dateFormatter.dateFormat = "dd"
        dateFormatter.locale = Locale(identifier: "ja_jp")
        timeFormatter.dateFormat = "HH:mm"
        timeFormatter.locale = Locale(identifier: "ja_jp")
    }
    
    var body: some View {
        ScrollView {
            // Top Graphic
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
                            if manager.city != "" {
                                Text(manager.city)
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
                            VStack {
                                Image(systemName: "\(date).square")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.white)
                                    .frame(width: 30, height: 30)
                                Text(time)
                                    .foregroundColor(.white)
                            }
                            VStack {
                                Image(systemName: "sun.min")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.white)
                                    .frame(width: 30, height: 30)
                                Text("13℃")
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.all, 10)
                    }
                }
            }
            
            //Top Content
            
            ScrollListView(title: "朝カフェ☕️")
            
            ScrollListView(title: "ショッピングにおすすめ🛍️")
            
            ScrollListView(title: "お出かけにおすすめ🗺")
            
            ScrollListView(title: "ランチ☀️")
            
            Spacer(minLength: 100)
            
        }
        .refreshable {
            print(manager.city)
        }
        .onAppear() {
            print(manager.city)
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                self.dateinfo = Date()
                date = dateFormatter.string(from: dateinfo)
                time = timeFormatter.string(from: dateinfo)
            }
        }
        .statusBarHidden()
        .ignoresSafeArea()
    }
}

struct SeatchQuery: Codable {
    var info: SearchInfo
    var data: SearchData
}

struct SearchInfo: Codable {
    var totalhits: String
}

struct SearchData : Codable {
    var ns: String
    var pageid: String
    var size: String
    var snippet: String
    var timestamp: String
    var title : String
    var wordcount: String
    
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
