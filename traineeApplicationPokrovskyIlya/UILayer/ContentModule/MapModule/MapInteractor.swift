//
//  MapInteractor.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 20.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import UIKit
import MapKit
import AppusViper
import SideMenu

protocol MapInteractorProtocol: class {
    var currentUserLatitude: Double? { get }
    var currentUserLongitude: Double? { get }
    
    func startUpdatingLocation()
    func stopUpdatingLocation()
}

final class MapInteractor: ViperInteractor {
    weak var presenter: MapPresenterProtocol!
    var sideMenuRepository: ISideMenuRepository!
    var locationService: ILocationService!
}

extension MapInteractor: ILocationDelegate {
    func didChangeCoordinated(latitude: Double, longitude: Double) {
        presenter.updateCoordinates(latitude: latitude, longitude: longitude)
    }
    
    func didFailWithError(error: Error) {
        presenter.updateCoordinatesError(error: error)
    }
}

extension MapInteractor: MapInteractorProtocol {
    var currentUserLatitude: Double? {
        return locationService.currentUserLatitude
    }
    
    var currentUserLongitude: Double? {
        return locationService.currentUserLongitude
    }
    
    func startUpdatingLocation() {
        locationService.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        locationService.stopUpdatingLocation()
    }
    
}
