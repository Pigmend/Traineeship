//
//  SideMenuViewController.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 18.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper
import Kingfisher

protocol SideMenuViewProtocol: class {
    var userName: String? { get set }
    
    var exploreSelected: Bool? { get set }
    var massageSelected: Bool? { get set }
    var usersSelected: Bool? { get set }
    var myPostsSelected: Bool? { get set }
    
    func clearSelected()
    func setAvatar(from url: URL)
    func setPlaceholder()
}

class SideMenuViewController: UIViewController, ViperView, IAlertHelper {
    weak var presenter: (SideMenuPresenterProtocol & IViewLifeCycle)!
    
    // MARK: - IBOutlets
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userAvatarImageView: UIImageView!
    
    @IBOutlet weak var exploreButtonCircleView: UIView!
    @IBOutlet weak var massagesButtonCircleView: UIView!
    @IBOutlet weak var usersButtonCircleView: UIView!
    @IBOutlet weak var myPostsButtonCircleView: UIView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad?()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.viewWillAppear?()
    }
    // MARK: - IBActions
    
    @IBAction func changeProfileButtonPressed(_ sender: UIButton) {
        presenter.changeProfileAction()
    }
    
    @IBAction func exploreButtonPressed(_ sender: UIButton) {
        presenter.exploreAction()
    }
    
    @IBAction func massagesButtonPressed(_ sender: UIButton) {
        presenter.messagesAction()
    }
    
    @IBAction func usersButtonPressed(_ sender: UIButton) {
        presenter.usersAction()
    }
    
    @IBAction func myPostsButtonPressed(_ sender: UIButton) {
        presenter.postsAction()
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        presenter.logoutAction()
    }
    
}

// MARK: - SideMenuViewController+SideMenuViewProtocol
extension SideMenuViewController: SideMenuViewProtocol {
    var userName: String? {
        get {
            return self.userNameLabel.text
        }
        set {
            self.userNameLabel.text = newValue
        }
    }
    
    var exploreSelected: Bool? {
        get {
            return nil
        }
        set (isSelected) {
            switch isSelected {
            case .some(let isSelected):
                self.exploreButtonCircleView.backgroundColor = isSelected ? R.color.choosenButton() : R.color.innactiveButton()
            case .none:
                break
            }
        }
    }
    
    var massageSelected: Bool? {
        get {
            return nil
        }
        set (isSelected) {
            switch isSelected {
            case .some(let isSelected):
                self.massagesButtonCircleView.backgroundColor = isSelected ? R.color.choosenButton() : R.color.innactiveButton()
            case .none:
                break
            }
        }
    }
    
    var usersSelected: Bool? {
        get {
            return nil
        }
        set (isSelected) {
            switch isSelected {
            case .some(let isSelected):
                self.usersButtonCircleView.backgroundColor = isSelected ? R.color.choosenButton() : R.color.innactiveButton()
            case .none:
                break
            }
        }
    }
    
    var myPostsSelected: Bool? {
        get {
            return nil
        }
        set (isSelected) {
            switch isSelected {
            case .some(let isSelected):
                self.myPostsButtonCircleView.backgroundColor = isSelected ? R.color.choosenButton() : R.color.innactiveButton()
            case .none:
                break
            }
        }
    }
    
    func clearSelected() {
        exploreButtonCircleView.backgroundColor = R.color.innactiveButton()
        massagesButtonCircleView.backgroundColor = R.color.innactiveButton()
        usersButtonCircleView.backgroundColor = R.color.innactiveButton()
        myPostsButtonCircleView.backgroundColor = R.color.innactiveButton()
    }
    
    func setAvatar(from url: URL) {
        let image = R.image.ic_placeholder()
        userAvatarImageView.kf.setImage(with: url, placeholder: image)
    }
    
    func setPlaceholder() {
        userAvatarImageView.image = R.image.ic_placeholder()
    }
}

extension SideMenuViewController: ISideMenuDelegate {
    func updatePhoto(to image: UIImage) {
        userAvatarImageView.image = image
    }
}
