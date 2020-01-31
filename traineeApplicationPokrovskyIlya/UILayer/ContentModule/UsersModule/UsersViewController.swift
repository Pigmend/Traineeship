//
//  UsersViewController.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 20.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper

protocol UsersViewProtocol: class {
    var loaderView: ILoader { get }
    func reloadData()
}

class UsersViewController: UIViewController, ViperView, IAlertHelper {
    weak var presenter: (UsersPresenterProtocol & IViewLifeCycle)!
    
    // MARK: - Properties
    var loader: ILoader!
    
    // MARK: - IBOutlet
    @IBOutlet weak var usersTableView: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad?()
        
        usersTableView.delegate = self
        usersTableView.dataSource = self
        
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

// MARK: - UsersViewController+UsersViewProtocol
extension UsersViewController: UsersViewProtocol {
    var loaderView: ILoader {
        return loader
    }
    
    func reloadData() {
        self.usersTableView.reloadData()
    }
}

// MARK: - UsersViewController+UITableViewDataSource
extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfUsers()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.usersTableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as? UserTableViewCell else { fatalError() }
        
        presenter.userFor(cell, at: indexPath.row)
        return cell
    }
}

// MARK: - UsersViewController+UITableViewDelegate
extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
