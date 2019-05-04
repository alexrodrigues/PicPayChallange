//
//  AppDelegate.swift
//  PicPayChallange
//
//  Created by Alex Rodrigues on 13/04/19.
//  Copyright © 2019 Alex Rodrigues. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Variables
    var window: UIWindow?
    private let navigationController: UINavigationController = {
        var navigation = UINavigationController()
        navigation.navigationBar.prefersLargeTitles = true
        navigation.navigationBar.barTintColor = .black
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return navigation
    }()
    
    private lazy var contactsViewController: ContactsViewController = {
       let contactVC = ContactsViewController()
        contactVC.title = "Contacts"
        return contactVC
    }()

    // MARK: - AppDelegate methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        navigationController.setViewControllers([contactsViewController], animated: false)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}
