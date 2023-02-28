//
//  Util.swift
//  Countdown
//
//  Created by Ronald Lee on 27/2/2023.
//

import Foundation
import Swift
import SwiftUI

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

func hexStringFromColor(_ color: Color?) -> String {
	if (color == nil) { return "#FFFFFF" }
	let components = color!.cgColor?.components
	let r: CGFloat = components?[0] ?? 0.0
	let g: CGFloat = components?[1] ?? 0.0
	let b: CGFloat = components?[2] ?? 0.0

	let hexString = String.init(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
	return hexString
}

func colorWithHexString(_ hexString: String?) -> Color {
	if (hexString == nil) { return Color.white }
	var colorString = hexString!.trimmingCharacters(in: .whitespacesAndNewlines)
	colorString = colorString.replacingOccurrences(of: "#", with: "").uppercased()

	let red: CGFloat = colorComponentFrom(colorString: colorString, start: 0, length: 2)
	let green: CGFloat = colorComponentFrom(colorString: colorString, start: 2, length: 2)
	let blue: CGFloat = colorComponentFrom(colorString: colorString, start: 4, length: 2)

	let color = Color(red: red, green: green, blue: blue)
	return color
}

func colorComponentFrom(colorString: String, start: Int, length: Int) -> CGFloat {
	let startIndex = colorString.index(colorString.startIndex, offsetBy: start)
	let endIndex = colorString.index(startIndex, offsetBy: length)
	let subString = colorString[startIndex..<endIndex]
	let fullHexString = length == 2 ? subString : "\(subString)\(subString)"
	var hexComponent: UInt32 = 0

	guard Scanner(string: String(fullHexString)).scanHexInt32(&hexComponent) else {
		return 0
	}
	let hexFloat: CGFloat = CGFloat(hexComponent)
	let floatValue: CGFloat = CGFloat(hexFloat / 255.0)
	return floatValue
}
