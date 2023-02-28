//
//  EventDetailView.swift
//  Countdown
//
//  Created by Ronald Lee on 26/2/2023.
//

import SwiftUI

struct EventDetail: View {
	@StateObject var notificationHandler = NotificationHandler()
	
	let persistenceController = PersistenceController.shared
	let event: Event
	var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	
	@State private var countdownString = ""
	@Environment(\.presentationMode) var presentation
	
	func delete() {
		timer.upstream.connect().cancel()
		
		notificationHandler.cancelNotification(uuid: event.notificationUUID)
		
		persistenceController.container.viewContext.delete(event)
		persistenceController.save()
		
		self.presentation.wrappedValue.dismiss()
	}
	
    var body: some View {
		VStack {
			HStack {
				Text(countdownString).padding()
			}
			.onReceive(timer) { time in
				countdownString =  CountdownToString(event.datetime)
			}
			HStack {
				Text("Event Name:").padding()
				Text(
					event.name ?? ""
				).padding()
			}
			HStack {
				Text("Event Date:").padding()
				Text(
					"\(DateToString(event.datetime))"
				).padding()
			}
			Button() {
				delete()
			} label: {
				Text("Delete")
			}.padding()
		}
		.navigationTitle("Create Event")
    }
}

struct EventDetail_Previews: PreviewProvider {
	static var previews: some View {
		let event = Event(context: PersistenceController.preview.container.viewContext)
		
		event.name = "Test"
		event.datetime = Date.now
		
		return EventDetail(event: event)
	}
}
