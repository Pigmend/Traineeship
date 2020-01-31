//
//  PostsViewController.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 20.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper

protocol PostsViewProtocol: class {

}

class PostsViewController: UIViewController, ViperView {
    weak var presenter: PostsPresenterProtocol!
    
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

// MARK: - PostsViewController+PostsViewProtocol
extension PostsViewController: PostsViewProtocol {

}
