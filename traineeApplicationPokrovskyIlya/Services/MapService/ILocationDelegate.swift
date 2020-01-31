//
//  ILocationServiceDelegate.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 10.12.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import UIKit
import MapKit

protocol ILocationDelegate: class {
    func didChangeCoordinated(latitude: Double, longitude: Double)
    func didFailWithError(error: Error)
}
