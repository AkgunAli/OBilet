//
//  AppDelegate.swift
//  OBilet-Project
//
//  Created by Ali Akgün on 25.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let clientApi = ClientAPI()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        getSession()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func getSession() {
        let id = UIDevice.current.identifierForVendor?.uuidString ?? "DD2A0857-7C7D-4376-A83B-E045435E82BB"
        clientApi.getSession(params: ["type":2,
                                      "connection": [:],
                                      "application":["version":"3.1.0.0","equipment-id":id]], succeed: { response in
            let userDefaults = UserDefaults.standard
            do {
                try userDefaults.setObjectt(response.dataObject, forKey: "sessionData")
            } catch {
                print(error.localizedDescription)
            }
        }, failed: { error in
            print("")
        })
    }
}

