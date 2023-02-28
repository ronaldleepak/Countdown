//
//  AppDelegate.swift
//  Countdown
//
//  Created by Ronald Lee on 26/2/2023.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		return true
	}
	//No callback in simulator -- must use device to get valid push token
	func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
		print(deviceToken)
	}
	
	func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
		print(error.localizedDescription)
	}
}
