//
//  Place.swift
//  GMap
//
//  Created by ahmed abdalla on 05/01/2022.
//

import Foundation
import Firebase

struct Place : Identifiable {
    var id: String = UUID().uuidString
    var uid: String
    let lat : Double
    let lng : Double
    let message : String
    
    init(dictionary: [String : Any]){
        self.uid = dictionary["uid"] as? String ?? ""
        self.lat = dictionary["lat"] as? Double ?? 0.0
        self.lng = dictionary["lng"] as? Double ?? 0.0
        self.message = dictionary["message"] as? String ?? ""
    }
}
