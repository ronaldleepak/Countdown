//
//  Util.swift
//  Countdown
//
//  Created by Ronald Lee on 27/2/2023.
//

import Foundation
import Swift
import UserNotifications

func DateToString(_ date: Date?) -> String {
	if (date == nil) { return ""; }
	let dateFormatter = DateFormatter()
	dateFormatter.dateFormat = "MM-dd-yyyy"
	return dateFormatter.string(from: date!)
}

func CountdownToString(_ date: Date?) -> String {
	if (date == nil) { return ""; }
	let timeSubtract: TimeInterval = date!.timeIntervalSinceReferenceDate - Date.now.timeIntervalSinceReferenceDate
	let timeIntervalFormatter = DateComponentsFormatter()
	timeIntervalFormatter.unitsStyle = .abbreviated
	timeIntervalFormatter.zeroFormattingBehavior = .dropAll
	timeIntervalFormatter.allowedUnits = [.day, .hour, .minute, .second]
	
	return timeIntervalFormatter.string(from: timeSubtract) ?? ""
}

func CreateNotification(eventName: String, date: Date) -> UUID {
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

func CancelNotification(uuid: UUID?) {
	if (uuid != nil) {
		let notificationCenter = UNUserNotificationCenter.current()
		notificationCenter.removePendingNotificationRequests(withIdentifiers: [uuid!.uuidString])
	}
}
