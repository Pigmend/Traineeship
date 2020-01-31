//
//  MapService.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 05.12.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class LocationService: NSObject, ILocationService, CLLocationManagerDelegate {
    
    var manager = CLLocationManager()
    weak var delegate: ILocationDelegate!
    
    override init() {
        super.init()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    var currentUserLatitude: Double? {
        return manager.location?.coordinate.latitude
    }
    
    var currentUserLongitude: Double? {
        return manager.location?.coordinate.longitude
    }
    
    func startUpdatingLocation() {
        manager.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latitude = locations.last?.coordinate.latitude,
            let longitude = locations.last?.coordinate.longitude else { return }
        delegate.didChangeCoordinated(latitude: latitude, longitude: longitude)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        delegate.didFailWithError(error: error)
    }
    
}
