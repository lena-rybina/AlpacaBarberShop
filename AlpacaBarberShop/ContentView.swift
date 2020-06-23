//
//  ContentView.swift
//  AlpacaBarberShop
//
//  Created by Elena Rybina on 6/22/20.
//  Copyright © 2020 Elena Rybina. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
           
            Color("Mint")
                .edgesIgnoringSafeArea(.all)
           
            VStack(alignment: .center) {
                StrokeText(text: "Hello human! \nI need a shave!", width: 1, color: Color.black)
                    .foregroundColor(.white)
                .multilineTextAlignment(.center)
                    .font(.largeTitle)
                        .fixedSize(horizontal: false, vertical: true)
                
                Image("alpaca-1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                    .cornerRadius(30)
                .overlay(RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.white, lineWidth: 5
                ))
                .shadow(radius: 10)
               
                Button(action: {}) {
                    Text("Start shaving")
                        .font(.largeTitle)
                        .padding()
                    //.background(Color.pink)
                        .background(LinearGradient(gradient: Gradient(colors: [Color("YOrange"), Color("Peach")]), startPoint: .leading, endPoint: .trailing))
                        .foregroundColor(Color.white)
                    .cornerRadius(20)
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color
    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}
