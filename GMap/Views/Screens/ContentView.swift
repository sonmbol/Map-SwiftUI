//
//  ContentView.swift
//  GMap
//
//  Created by ahmed abdalla on 06/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel : LoginViewModel
    
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                MapView()
            }else{
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
