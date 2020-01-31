//
//  AppDelegate.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 11.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import SideMenu
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var auth: FUIAuth?
    var authService: IAuthService!
    var usersRepository: IUsersRepository!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.configureDependencies()
        self.startAppFlow()
        
        return true
    }
    
    private func configureDependencies() {
        FirebaseApp.configure()
        IQKeyboardManager.shared.enable = true
        self.auth = FUIAuth.defaultAuthUI()
        self.auth?.delegate = self
        self.auth?.providers = [FUIEmailAuth()]
        self.authService = FirebaseAuthService()
        self.usersRepository = RealtimeDatabaseUsersRepository()
    }
    
    private func startAppFlow() {
        self.window = UIWindow()
        guard let splash = R.storyboard.splash().instantiateInitialViewController() as? SplashViewController else {
            fatalError("Splash view controller is not described")
        }
        splash.completionHandler = { [unowned self] in
            self.showMainMenuIfUserLogedIn()
        }
        self.window?.rootViewController = splash
        self.window?.makeKeyAndVisible()
    }
    
    private func showSideMenu() {
        let navStackVC = UINavigationController(rootViewController: Map().view)
        navStackVC.navigationBar.backgroundColor = #colorLiteral(red: 0.8315050194, green: 0.8315050194, blue: 0.8315050194, alpha: 1)
        
        let sideMenuVC = SideMenu(navigationStackViewController: navStackVC)
        
        let mainMenuNavigationController = UISideMenuNavigationController(rootViewController: sideMenuVC.view)
        SideMenuManager.default.menuLeftNavigationController = mainMenuNavigationController
        
        SideMenuManager.default.menuPresentMode = .viewSlideOut
        SideMenuManager.default.menuFadeStatusBar = false
        let sideMenuWidth = UIScreen.main.bounds.width * 0.8
        SideMenuManager.default.menuWidth = sideMenuWidth
        
        self.window?.rootViewController?.present(navStackVC, animated: true)
    }
}

extension AppDelegate: FUIAuthDelegate {
    func authPickerViewController(forAuthUI authUI: FUIAuth) -> FUIAuthPickerViewController {
        return AuthPickerViewController(forAuthUI: authUI)
    }
    
    func emailEntryViewController(forAuthUI authUI: FUIAuth) -> FUIEmailEntryViewController {
        return EmailEntryViewController(nibName: nil, bundle: nil, authUI: authUI)
    }
    
    func passwordSignInViewController(forAuthUI authUI: FUIAuth, email: String) -> FUIPasswordSignInViewController {
        return PasswordSignInViewController(nibName: nil, bundle: nil, authUI: authUI, email: email)
    }
    
    func passwordRecoveryViewController(forAuthUI authUI: FUIAuth, email: String) -> FUIPasswordRecoveryViewController {
        return PasswordRecoveryViewController(nibName: nil, bundle: nil, authUI: authUI, email: email)
    }
    
    func passwordSignUpViewController(forAuthUI authUI: FUIAuth, email: String) -> FUIPasswordSignUpViewController {
        return PasswordSignUpViewController(nibName: nil, bundle: nil, authUI: authUI, email: email)
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if error != nil {
            startLoggIn()
        } else {
            guard let user = authDataResult?.user else { return }
            guard let username = user.displayName else { return }
            guard let email = user.email else { return }
            let newUser = User(uid: user.uid, email: email, name: username, imageURL: nil)
            if (try? usersRepository.addUserToDatabase(user: newUser)) != nil {
                startMainMenu()
            } else {
                return
            }
        }
    }
    private func startMainMenu() {
        showSideMenu()
    }
    
    private func startLoggIn() {
        let authVC = authService.getAuthController()
        self.window?.rootViewController?.present(authVC, animated: true)
    }
    
    private func showMainMenuIfUserLogedIn() {
        if authService.isLoggedIn() {
            startMainMenu()
        } else {
            startLoggIn()
        }
    }
    
}
