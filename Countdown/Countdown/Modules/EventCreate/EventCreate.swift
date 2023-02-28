//
//  EventCreateView.swift
//  Countdown
//
//  Created by Ronald Lee on 26/2/2023.
//

import SwiftUI

struct EventCreate: View {
	let persistenceController = PersistenceController.shared
	@StateObject var notificationHandler = NotificationHandler()
	
	@State private var name: String = ""
	@State private var datetime: Date = Date.now
	@State private var eventColor = Color.white
	
	@Environment(\.presentationMode) var presentation
	
	func submit() {
		// submit
		let event = Event(context: persistenceController.container.viewContext)

		event.id = UUID()
		event.name = name
		event.datetime = datetime
		event.colorHex = hexStringFromColor(eventColor)
		event.notificationUUID = notificationHandler.createNotification(eventName: name, date: datetime)

		persistenceController.save()
		
		self.presentation.wrappedValue.dismiss()
	}
	
    var body: some View {
		VStack {
			HStack {
				Text("Event Name:").padding()
				TextField(
					"Enter Event Name..",
					text: $name
				).padding()
			}
			HStack {
				DatePicker(selection: $datetime, displayedComponents: .date) {
					 Text("Select a Date:")
				}.padding()
			}
			HStack {
				DatePicker(selection: $datetime, displayedComponents: .hourAndMinute) {
					 Text("Select Time:")
				}.padding()
			}
			HStack {
				ColorPicker("Event color:", selection: $eventColor).padding()
			}
			Button() {
				submit()
			} label: {
				Text("Submit")
			}.padding()
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(eventColor)
		.navigationTitle("Create Event")
    }
}

struct EventCreate_Previews: PreviewProvider {
    static var previews: some View {
        EventCreate()
    }
}
