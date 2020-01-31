//
//  IMapService.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 05.12.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import UIKit
import MapKit

protocol ILocationService: class {
    var delegate: ILocationDelegate! { get set }
    
    var currentUserLatitude: Double? { get }
    var currentUserLongitude: Double? { get }
    
    func startUpdatingLocation()
    func stopUpdatingLocation()
}
