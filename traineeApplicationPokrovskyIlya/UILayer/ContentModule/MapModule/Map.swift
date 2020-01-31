//
//  Map.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 20.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper

class Map: Module<MapViewController, MapPresenter, MapInteractor, MapRouter> {
    override init() {
        super.init()
        self.router.sideMenuRepository = SideMenuRepository()
        self.interactor.locationService = LocationService()
        self.interactor.locationService.delegate = self.interactor
    }
}
