//
//  CustomButtonView.swift
//  GMap
//
//  Created by ahmed abdalla on 06/01/2022.
//

import SwiftUI

struct CustomButtonView: View {
    
    var title: String = ""
    var BackgroundColor: Color = Color("AccentColor")
    var cornerRadius: Double = 20.0
    var height: Double = 50.0
    var action: () -> Void = {}
    var body: some View {
        
        Button(action: action) {
            ZStack{
                BackgroundColor
                Text(title)
                    .font(.custom("NunitoSans-Bold", fixedSize: 16))
                    .foregroundColor(.white)
                    .padding()
                    .cornerRadius(cornerRadius)
            }
            .frame(height: height,alignment: .center)
            .cornerRadius(cornerRadius)
            .padding(.horizontal,8)
        }
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView()
    }
}
