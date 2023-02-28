//
//  NotificationHandler.swift
//  Countdown
//
//  Created by Ronald Lee on 27/2/2023.
//

import Foundation
import UserNotifications

class NotificationHandler: ObservableObject {
	
	func requestNotification() {
		UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
			if success {
				print("All set!")
			} else if let error = error {
				print(error.localizedDescription)
			}
		}
	}

	func createNotification(eventName: String, date: Date) -> UUID {
		let content = UNMutableNotificationContent()
		content.title = "Countdown"
		content.body = eventName
		
		let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
		let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
		
		// Create the request
		let uuid = UUID()
		let uuidString = uuid.uuidString
		let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)

		// Schedule the request with the system.
		let notificationCenter = UNUserNotificationCenter.current()
		notificationCenter.add(request) { (error) in
			if error != nil {
				// Handle any errors.
			}
		}
		
		return uuid
	}

	func cancelNotification(uuid: UUID?) {
		if (uuid != nil) {
			let notificationCenter = UNUserNotificationCenter.current()
			notificationCenter.removePendingNotificationRequests(withIdentifiers: [uuid!.uuidString])
		}
	}
	
	init() {
		requestNotification()
	}
}


