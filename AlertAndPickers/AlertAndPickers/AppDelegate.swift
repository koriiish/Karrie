//
//  AppDelegate.swift
//  AlertAndPickers
//
//  Created by berdy on 04.02.24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }
}

//MARK: - Error handling
extension AppDelegate {
    override func handle(_ error: Error, from controller: UIViewController) {
        guard let object = error as? RecoverableError else { return }
        guard window?.rootViewController?.presentedViewController == nil else { return }
        var action: UIAlertAction?
        if let actionObject = object.action {
            action = .makeDefault(title: actionObject.title, handler: actionObject.body)
        }
        
        let alert = UIAlertController.make(
            title: object.title,
            message: object.message,
            rightAction: action
        )
        window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
