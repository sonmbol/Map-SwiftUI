//
//  GoogleMapViewModel.swift
//  GMap
//
//  Created by ahmed abdalla on 05/01/2022.
//

import SwiftUI
import GoogleMaps


struct GoogleMapViewModel : UIViewRepresentable {
    
    typealias UIViewType = GMSMapView
    
    @Binding var places : [Place]
    @Binding var currnetM: CLLocationCoordinate2D
    @ObservedObject var locationManager = LocationManager()
    
    func makeUIView(context: Context) -> GMSMapView {
        locationManager.startLocation()
        let lat =  25.101673
        let lng =  55.173773
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude:  lng, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera
        )
        mapView.mapType = .terrain
        mapView.delegate = context.coordinator
        
        return mapView
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {
        // When the locationManager publishes updates, respond to them
        if let myLocation = locationManager.lastKnownLocation {
            locationManager.stopLocation()
            uiView.animate(toLocation: myLocation.coordinate)
        }
        context.coordinator.addMarkers(mapView: uiView,places: places)
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    
    
}
