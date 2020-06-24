//
//  ContentView.swift
//  AlpacaBarberShop
//
//  Created by Elena Rybina on 6/22/20.
//  Copyright © 2020 Elena Rybina. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State
    var state: AlpacaState = .notStarted
    
    var uiState: AlpacaUI {
        switch state {
            
        case .notStarted: return AlpacaUI(topText: "Hello human! \nI need a shave!",
                                          imageName: "notStarted",
                                          buttonText: "Let's Go!")
        case .inProgress: return  AlpacaUI(topText: "Shave more! \nI'm almost there",
                                           imageName: "notStarted",
                                           buttonText: "Shave more!")
        default: return AlpacaUI(topText: "I'm smooth baby",
                                 imageName: "shaved",
                                 buttonText: "Thank You!")
            
        }
    }
  
    var body: some View {
        ZStack {
                Color.white
                VStack(alignment: .center) {
                    StrokeText(text: "\(uiState.topText)", width: 1, color: Color.pink)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .font(.largeTitle)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Image("\(uiState.imageName)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .cornerRadius(30)
                        .overlay(RoundedRectangle(cornerRadius: 30) .stroke(Color.white, lineWidth: 5))
                        .shadow(radius: 10)
                    
                    
                    Button(action: {print("Hey Listen!")}) {
                        Text("\(uiState.buttonText)")
                            .font(.largeTitle)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: [Color("YOrange"), Color("Peach")]), startPoint: .leading, endPoint: .trailing))
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .onTapGesture {
                                self.state.shave()
                                print("Tapped! - \(self.state)")
                        }
                    }
                }
                
            }
        }
    }



struct AlpacaUI {
    var topText: String
    var imageName: String
    var buttonText: String
}

enum AlpacaState {
    case shaved
    case notStarted
    case inProgress(Int)
    
    mutating func shave(with step: Int = 20) {
        switch self {
        case .shaved: break
        case .notStarted:
            self = .inProgress(0)
        case .inProgress(let progress):
            switch progress {
            case Int.min..<0: self = .notStarted
            case (100-step)...Int.max: self = .shaved
            default: self = .inProgress(progress + step)
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
