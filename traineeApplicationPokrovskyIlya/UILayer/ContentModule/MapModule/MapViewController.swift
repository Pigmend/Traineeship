//
//  MapViewController.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 20.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper
import SideMenu
import MapKit

protocol MapViewProtocol: class {
    func setCurrentUserLocation(longitude: Double, latitude: Double)
}

class MapViewController: UIViewController, ViperView, IAlertHelper {
    weak var presenter: (MapPresenterProtocol & IViewLifeCycle)!
    
    // MARK: - IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad?()
        
        initButtonsForNavigationItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear?()
    }
    
    // MARK: - IBActions
    @objc func sideMenuButtonPressed() {
        presenter.sideMenuAction()
    }
    
    // MARK: - Private
    private func initButtonsForNavigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: R.image.ic_burger(), style: .plain, target: self, action: #selector(sideMenuButtonPressed))
    }
}

// MARK: - MapViewController+MapViewProtocol
extension MapViewController: MapViewProtocol {
    
    func setCurrentUserLocation(longitude: Double, latitude: Double) {
        var coordinates = CLLocationCoordinate2D()
        coordinates.latitude = latitude
        coordinates.longitude = longitude
        
        mapView.centerCoordinate = coordinates
    }
    
}
