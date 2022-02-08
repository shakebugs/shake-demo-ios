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
    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let defaults = UserDefaults.standard
        
        // Shaking invocation
        if defaults.object(forKey: "isInvokedByShakeDeviceEvent") == nil{
            defaults.set(true, forKey: "isInvokedByShakeDeviceEvent")
        }
        Shake.configuration.isInvokedByShakeDeviceEvent = defaults.bool(forKey: "isInvokedByShakeDeviceEvent")
                
        // Floating button invocation
        if defaults.object(forKey: "isFloatingReportButtonShown") == nil{
            defaults.set(false, forKey: "isFloatingReportButtonShown")
        }
        Shake.configuration.isFloatingReportButtonShown = defaults.bool(forKey: "isFloatingReportButtonShown")
        
        
        // Screenshot invocation method
        if defaults.object(forKey: "isInvokedByScreenshot") == nil{
            defaults.set(false, forKey: "isInvokedByScreenshot")
        }
        Shake.configuration.isInvokedByScreenshot = defaults.bool(forKey: "isInvokedByScreenshot")
        
        
        // Console logs enabled/disabled
        if defaults.object(forKey: "isConsoleLogsEnabled") == nil{
            defaults.set(false, forKey: "isConsoleLogsEnabled")
        }
        Shake.configuration.isConsoleLogsEnabled = defaults.bool(forKey: "isConsoleLogsEnabled")
        
        // Blackbox enabled/disabled
        if defaults.object(forKey: "isBlackBoxEnabled") == nil{
            defaults.set(false, forKey: "isBlackBoxEnabled")
        }
        Shake.configuration.isBlackBoxEnabled = defaults.bool(forKey: "isBlackBoxEnabled")
        
        
        // Included screenshot enabled/disabled
        if defaults.object(forKey: "isScreenshotIncluded") == nil{
            defaults.set(false, forKey: "isScreenshotIncluded")
        }
        Shake.configuration.isScreenshotIncluded = defaults.bool(forKey: "isScreenshotIncluded")
        
        
        // Email field enabled/disabled
        if defaults.object(forKey: "isEmailFieldEnabled") == nil{
            defaults.set(false, forKey: "isEmailFieldEnabled")
        }
        Shake.configuration.isEmailFieldEnabled = defaults.bool(forKey: "isEmailFieldEnabled")
        
        // Inspect screen enabled/disabled
        if defaults.object(forKey: "isInspectScreenEnabled") == nil{
            defaults.set(false, forKey: "isInspectScreenEnabled")
        }
        Shake.configuration.isInspectScreenEnabled = defaults.bool(forKey: "isInspectScreenEnabled")
        
        
        // Feedback type enabled/disabled
        if defaults.object(forKey: "isFeedbackTypeEnabled") == nil{
            defaults.set(false, forKey: "isFeedbackTypeEnabled")
        }
        Shake.configuration.isFeedbackTypeEnabled = defaults.bool(forKey: "isFeedbackTypeEnabled")
        
        // Feedback type enabled/disabled
        if defaults.object(forKey: "shakingThreshold") == nil{
            defaults.set(600, forKey: "shakingThreshold")
        }
        Shake.configuration.shakingThreshold = defaults.float(forKey: "shakingThreshold")
   
        Shake.configuration.isCrashReportingEnabled = true
        Shake.configuration.isAskForCrashDescriptionEnabled = true
        Shake.configuration.setShowIntroMessage = true
        Shake.configuration.isInvokedByRightEdgePan = false
        Shake.configuration.isAutoVideoRecordingEnabled = false
        
        Shake.start(clientId: "lEtd511X2gn3qsgR1RWPVEL15RpKbdY0r6x99LFP", clientSecret: "nErTSH6tgNB1dMDAQKQaMNA1d8yD8tEDl82XPrYQEucvG9vFy89JqWZ")
        
        Shake.registerUser(userId: UIDevice.current.identifierForVendor!.uuidString)
        
        var userMetadata = [String: String]()
        
        userMetadata = [
            "first_name": "John",
            "last_name": "Doe",
            "email": "john.doe@email.com",
            "status": "Active",
            "cartItems": "3",
            "cartTotal": "$25.33"
        ]
        
        Shake.updateUserMetadata(userMetadata)
        
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

