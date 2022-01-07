//
//  LocationService.swift
//  GMap
//
//  Created by ahmed abdalla on 06/01/2022.
//


import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var lastKnownLocation: CLLocation? = nil  // Publish the user's location so subscribers can react to updates
    let manager = CLLocationManager()
    var firstTimeCalled = true  // For prevent change authorization to called
    
    override init() {
        super.init()
        manager.delegate = self
        
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            lastKnownLocation = location
        }
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard !firstTimeCalled else {
            firstTimeCalled = false
            return
        }
        if status == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }
    
    // TODO:  Location start updating after authorization
    func startLocation(){
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        manager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
        }
    }
    
    // TODO: - Location stop updating
    func stopLocation(){
        manager.stopUpdatingLocation()
    }
    
}
