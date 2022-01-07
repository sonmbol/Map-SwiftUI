//
//  LoginView.swift
//  GMap
//
//  Created by ahmed abdalla on 06/01/2022.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModel : LoginViewModel
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        ZStack{
            //  Backgound Image
            Image("bg")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .scaledToFill()
            
            VStack(spacing:20){
                //  logo
                Image("logo")
                    .resizable()
                    .frame(width: 166.14, height: 150)
                    .padding(.top, 150)
                Spacer()
                
                VStack(spacing:20){
                    CustomTextFieldView(text: $email, placeholder: "Email",cornerRadius: 20)
                    CustomTextFieldView(text: $password,placeholder: "Password", secure : true,cornerRadius: 20)
                    
                }
                if viewModel.isLoading{
                    // Progress while loading
                    CustomProgressView()
                }else{
                    //  Button SignIn
                    CustomButtonView(title: "SIGN IN") {
                        viewModel.login(email: email, password: password)
                    }
                }
                
            }
            .foregroundColor(.white)
            .padding(.horizontal,20)
            .padding(.bottom,100)
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
