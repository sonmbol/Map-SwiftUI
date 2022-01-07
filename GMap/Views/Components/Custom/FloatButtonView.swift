//
//  FloatButtonView.swift
//  GMap
//
//  Created by ahmed abdalla on 06/01/2022.
//

import SwiftUI

struct FloatButtonView: View {
    var image : String
    var color : Color = Color("AccentColor")
    var action: () -> Void = {}
    var body: some View {
        Button(action: action, label: {
            Image(systemName: image)
                .resizable()
                .frame(width: 32, height: 32)
                .padding()
                .scaledToFit()
        })
            .background(color)
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
    }
}

struct FloatButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FloatButtonView(image: "", color: .white)
    }
}
