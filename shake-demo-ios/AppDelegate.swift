//
//  AppDelegate.swift
//  shake-demo-ios
//
//  Created by Sanjin Grahovar Sadiković on 05.11.2021..
//

import UIKit
import Shake

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let defaults = UserDefaults.standard

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if defaults.bool(forKey: "firstLaunch") == true{
            
        } else{
            Shake.configuration.isCrashReportingEnabled = true
            Shake.configuration.isAskForCrashDescriptionEnabled = true
            Shake.configuration.isConsoleLogsEnabled = false
            Shake.configuration.isBlackBoxEnabled = true
            Shake.configuration.isAutoVideoRecordingEnabled = false
            Shake.configuration.setShowIntroMessage = true
            
            Shake.configuration.isFloatingReportButtonShown = false
            Shake.configuration.isInvokedByShakeDeviceEvent = true
            Shake.configuration.isInvokedByScreenshot = false
            
            Shake.configuration.isFeedbackTypeEnabled = true
            Shake.configuration.isEmailFieldEnabled = true
            Shake.configuration.isInspectScreenEnabled = true
            
            Shake.configuration.isScreenshotIncluded = true
        }
        

         
        
        Shake.start(clientId: "3z2HNzwBlifX9o5oayO2eRbD1qtytYNW4JlzF7bc", clientSecret: "CLVD8gq0GPmJbLTYwublgig2tZuk1QAvRrCiUekG3Jy0K249l1xAqob")
        
        Shake.registerUser(userId: UIDevice.current.identifierForVendor!.uuidString)
        
        return true
    }

    // MARK: UISceneSession Lifecycle
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

