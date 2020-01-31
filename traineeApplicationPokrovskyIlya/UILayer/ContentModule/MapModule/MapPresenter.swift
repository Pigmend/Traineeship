//
//  MapPresenter.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 20.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import UIKit
import MapKit
import AppusViper
import SideMenu

protocol MapPresenterProtocol: class {
    func sideMenuAction()
    func updateCoordinates(latitude: Double, longitude: Double)
    func updateCoordinatesError(error: Error)
}

final class MapPresenter: ViperPresenter {
    weak var view: (MapViewProtocol & IAlertHelper)!
    weak var interactor: MapInteractorProtocol!
    weak var router: MapRouterProtocol!
}

extension MapPresenter: IViewLifeCycle {
    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
        guard let latitude = interactor.currentUserLatitude,
            let longitude = interactor.currentUserLongitude else { return }
        
        view.setCurrentUserLocation(longitude: longitude, latitude: latitude)
    }
}

extension MapPresenter: MapPresenterProtocol {
    func sideMenuAction() {
        router.showSideMenu()
    }
    
    func updateCoordinates(latitude: Double, longitude: Double) {
        view.setCurrentUserLocation(longitude: latitude, latitude: longitude)
    }
    
    func updateCoordinatesError(error: Error) {
        view.showError(message: error.localizedDescription)
    }
    
}
