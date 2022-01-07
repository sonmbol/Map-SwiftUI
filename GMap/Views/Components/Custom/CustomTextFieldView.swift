//
//  CustomTextFieldView.swift
//  GMap
//
//  Created by ahmed abdalla on 06/01/2022.
//

import SwiftUI

struct CustomTextFieldView: View {
    @Binding var text: String
    var placeholder: String = ""
    var secure: Bool = false
    var cornerRadius: Double = 0.0
    var body: some View {
        
        ZStack() {
            if secure {
                SecureField(placeholder, text: $text)
                    .cornerRadius(cornerRadius)
                    .padding()
            }else{
                TextField(placeholder, text: $text)
                    .font(.custom("NunitoSans-Bold", fixedSize: 14))
                    .cornerRadius(cornerRadius)
                    .padding()
            }
        }
        .frame(height:50)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color.gray, lineWidth: 2)
        )
        .padding([.leading, .trailing], 8)
    }
}

struct CustomTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextFieldView(text: .constant("Email"))
    }
}
