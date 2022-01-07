//
//  CustomTextEditorView.swift
//  GMap
//
//  Created by ahmed abdalla on 06/01/2022.
//

import SwiftUI

struct CustomTextEditorView: View {
    
    @Binding var text: String
    var placeholder: String = ""
    var cornerRadius: Double = 20.0
    var height: Double = 100.0
    
    var body: some View {
        ZStack {
            HStack {
                if text.isEmpty {
                    Text(placeholder)
                        .opacity(0.4)
                        .padding(10)
                }
                Spacer()
            }
            TextEditor(text: $text)
                .font(.custom("NunitoSans-Regular", fixedSize: 14))
                .lineLimit(4)
                .frame(height: height)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.gray, lineWidth: 2)
                )
                .padding(8)
            
        }.onTapGesture {
            UIApplication.dismissKeyboard()
        }
    }
}

struct CustomTextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextEditorView(text: .constant(""))
    }
}


