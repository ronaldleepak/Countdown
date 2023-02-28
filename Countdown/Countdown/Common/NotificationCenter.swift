//
//  NotificationCenter.swift
//  Countdown
//
//  Created by Ronald Lee on 27/2/2023.
//

import Foundation
import UserNotifications

class NotificationCenter: NSObject, ObservableObject {
	@Published var dumbData: UNNotificationResponse?
	
	override init() {
		super.init()
		UNUserNotificationCenter.current().delegate = self
	}
}

extension NotificationCenter: UNUserNotificationCenterDelegate  {
	func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
		completionHandler([.sound, .badge])
	}

	func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
		dumbData = response
		completionHandler()
	}

	func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) { }
}
