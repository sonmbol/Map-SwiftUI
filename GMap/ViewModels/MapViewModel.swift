//
//  MapViewModel.swift
//  GMap
//
//  Created by ahmed abdalla on 05/01/2022.
//

import SwiftUI
import Firebase
import CoreLocation

class MapViewModel: ObservableObject {
    @EnvironmentObject var viewModel : LoginViewModel
    @Published var places = [Place]()
    @Published var selectedMarker = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
    @Published var message: String = ""
    
    init(){
        fetechPlaces()
    }
    
    
    // MARK: - fetech places from firestore
    func fetechPlaces(){
        Constants.COLLECTION_PLACES.addSnapshotListener  {[unowned self] (snapshot, error )in
            if let error = error {
                print("Mark : Firestore places \(error.localizedDescription)")
            }
            guard let documents = snapshot?.documents else {
                print("Mark : Firestore places Empty")
                return
            }
            
            self.places = documents.map({ Place(dictionary: $0.data()) })
            
        }
    }
    
    // MARK: - add new place in firestore
    func addPlace(){
        var uid = ""
         if let UID = Persistence.loadKeyChain(key: Constants.UID){
            uid = String(decoding: UID, as: UTF8.self)
        }
        let data : [String : Any] = [
            "uid" : uid,
            "lat" : selectedMarker.latitude,
            "lng" : selectedMarker.longitude,
            "message" : message
        ]
        
        Constants.COLLECTION_PLACES.document(UUID().uuidString).setData(data) { error in
            if let error = error {
                print("MARK : add place in Firestore : \(error.localizedDescription)")
            }
            self.message = ""
        }
    }
    
    
}
