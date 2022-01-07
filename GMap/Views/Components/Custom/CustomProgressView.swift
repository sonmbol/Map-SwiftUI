//
//  CustomProgressView.swift
//  GMap
//
//  Created by ahmed abdalla on 07/01/2022.
//

import SwiftUI


struct CustomProgressView: View {
    
    @State var angle: Double = 0.0
    @State var isAnimating = false
    var foreverAnimation: Animation {
        Animation.linear(duration: 1.5)
            .repeatForever(autoreverses: false)
    }
    var body: some View {
        
        ZStack{
            Circle()
                .fill(LinearGradient(gradient: .init(colors: [.red,.blue,.green]), startPoint: .topLeading, endPoint: .bottomLeading))
                .frame(width: 50, height: 50)
                .rotationEffect(Angle(degrees: self.isAnimating ? 360 : 0.0))
                .animation(self.isAnimating ? foreverAnimation : .default)
                .onAppear { self.isAnimating = true }
                .onDisappear { self.isAnimating = false }
        }
        
    }
}

