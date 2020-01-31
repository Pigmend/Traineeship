//
//  MassagesViewController.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 20.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper

protocol MassagesViewProtocol: class {

}

class MassagesViewController: UIViewController, ViperView {
    weak var presenter: MassagesPresenterProtocol!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initButtonsForNavigationItem()
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

// MARK: - MassagesViewController+MassagesViewProtocol
extension MassagesViewController: MassagesViewProtocol {

}
