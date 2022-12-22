//
//  LoadingView.swift
//  City Guide
//
//  Created by developer on 2022/12/22.
//

import SwiftUI

struct LoadingView: View {
    @State var show = false
    var width:CGFloat = 100
    var height:CGFloat = 100
    
    var body : some View{
        
        ZStack{
            
            Color.black.opacity(0.09)
                .frame(width:width, height: height)
            
            Color("LoadingColor")
                .frame(width:width, height: height)
            .cornerRadius(10)
            .mask(
            
                Rectangle()
                .fill(
                
                    LinearGradient(gradient: .init(colors: [.clear,.clear, Color("LoadingColor").opacity(0.7),.clear, .clear]), startPoint: .top, endPoint: .bottom)
                )
                .rotationEffect(.init(degrees: 90))
                .offset(x: self.show ? width  : -width)
            
            )
        }
        .onAppear {
            
            withAnimation(Animation.default.speed(0.2).delay(0).repeatForever(autoreverses: false)){
                
                self.show.toggle()
            }
        }
    }

}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
