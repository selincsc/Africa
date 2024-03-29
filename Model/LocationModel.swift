//
//  LocationModel.swift
//  Africa
//
//  Created by Selin Çağlar on 11.01.2023.
//

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable{
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    //Computed Property
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
