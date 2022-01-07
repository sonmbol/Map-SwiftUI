//
//  PlaceView.swift
//  GMap
//
//  Created by ahmed abdalla on 06/01/2022.
//

import SwiftUI



struct PlaceView: View {
    
    
    @Binding var message: String
    var action : () -> Void = {}
    
    var body: some View {
        
        VStack(alignment : .center) {
            
            CustomTextEditorView(text: $message,placeholder: "Message")
            
            CustomButtonView(title: "Add Place" ){
                UIApplication.dismissKeyboard()
                action()
            }
            
        }
    }
}

struct PlaceView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceView(message:  .constant("Message"))
    }
}


