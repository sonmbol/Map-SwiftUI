//
//  ContentView.swift
//  GMap
//
//  Created by ahmed abdalla on 05/01/2022.
//

import SwiftUI
import GoogleMaps
import SlideOverCard

struct MapView: View {
    
    @EnvironmentObject var LoginviewModel : LoginViewModel
    @ObservedObject var viewModel = MapViewModel()
    @State var addMarker = false
    @State var isPresented = false
    @State var logOut = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                //MapView
                GoogleMapViewModel(places: $viewModel.places, currnetM: $viewModel.selectedMarker)
                    .frame(alignment: .center)
                    .edgesIgnoringSafeArea(.bottom)
                
                // Marker
                if addMarker {
                    Image("black_pin")
                        .resizable()
                        .frame(width: 20, height: 32,alignment: .center)
                        .foregroundColor(Color.black)
                        .edgesIgnoringSafeArea(.bottom)
                }
                
                HStack(alignment: VerticalAlignment.bottom) {
                    Spacer()
                    VStack(alignment: .trailing,spacing: 10){
                        Spacer()
                        // for dismiss marker
                        if addMarker{
                            FloatButtonView(image : "location.slash"){
                                addMarker.toggle()
                            }
                        }
                        // for show marker or add message to marker
                        FloatButtonView(image : addMarker ? "plus" : "plus.viewfinder" ){
                            addMarker ?  isPresented.toggle() :   addMarker.toggle()
                        }
                    }
                }
                // mrker form
                .slideOverCard(isPresented: $isPresented) {
                    PlaceView(message: $viewModel.message) {
                        self.viewModel.addPlace()
                        self.addMarker.toggle()
                        self.isPresented.toggle()
                    }
                }
            }
            
            .navigationTitle("Map")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    logOut.toggle()
                } label: {
                    Image(systemName: "power")
                }
                
            }
            
            // confirmation alert for signout
            .alert(isPresented: $logOut) { () -> Alert in
                Alert(title: Text("Sign out"), message: Text("Are you sure to signout?"), primaryButton: .default(Text("Sign out"), action: {
                    LoginviewModel.signOut()
                }), secondaryButton: .default(Text("Cancel")))
            }
        }
    }
}




struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
