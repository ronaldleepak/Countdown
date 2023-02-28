//
//  NotificationCenter.swift
//  Countdown
//
//  Created by Ronald Lee on 27/2/2023.
//

import Foundation
import UserNotifications

class NotificationCenter: NSObject, ObservableObject {
	@Published var notificationResponse: UNNotificationResponse?
	
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
		notificationResponse = response
		completionHandler()
	}

	func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) { }
}
