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
		requestNotification()
		
		return true
	}
	
	func requestNotification() {
		UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
			if success {
				print("All set!")
			} else if let error = error {
				print(error.localizedDescription)
			}
		}
	}
}
