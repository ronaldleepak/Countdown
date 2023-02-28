//
//  Util.swift
//  Countdown
//
//  Created by Ronald Lee on 27/2/2023.
//

import Foundation
import Swift

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
