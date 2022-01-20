//
//  GoogleMapCoordinator.swift
//  GMap
//
//  Created by ahmed abdalla on 05/01/2022.
//

import SwiftUI
import GoogleMaps


class GoogleMapCoordinator: NSObject ,ObservableObject{
    
    
    let owner: GoogleMapViewModel       // access to owner view members,
    var oldPlaces = [Place]()
    
    init(_ parent: GoogleMapViewModel){
        
        owner = parent
    }
    
    
    func addMarkers(mapView : GMSMapView,places : [Place]){
        let oldPlacesID = oldPlaces.map({ $0.id })
        //        let newPlacesCoord = places.map({ CLLocationCoordinate2D(latitude: $0.lat, longitude: $0.lng) })
        let newPlaces = places.filter({ !oldPlacesID.contains($0.id)  })
        //        let markerChanged = oldPlaces.filter({ !newPlacesCoord.contains(where: CLLocationCoordinate2D(latitude: $0.lat, longitude: $0.lng)) })
        
        newPlaces.forEach { place in
            let marker = GMSMarker()
            marker.icon = UIImage(named: "red_pin")
            let coord = CLLocationCoordinate2D(latitude: place.lat, longitude: place.lng)
            marker.position = coord
            marker.snippet = place.message
            
            marker.map = mapView
            
            oldPlaces.append(place)
        }
    }
    
    
    
}

// MARK: - Map DELEGATE

extension GoogleMapCoordinator : GMSMapViewDelegate{
    
    /**
     * Called repeatedly during any animations or gestures on the map (or once, if the camera is
     * explicitly set). This may not be called for all intermediate camera positions. It is always
     * called for the final position of an animation or gesture.
     */
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        
        owner.currnetM = CLLocationCoordinate2D(latitude:  position.target.latitude, longitude: position.target.longitude)
        
    }
}
