//
//  EventList.swift
//  Countdown
//
//  Created by Ronald Lee on 26/2/2023.
//

import Foundation
import CoreData
import SwiftUI

class EventListController: ObservableObject {
	@FetchRequest(sortDescriptors: []) var events: FetchedResults<Event>
	
	func showDetail(eventId: UUID) {
		// show detail
		print("Show detail")
	}
	
	func createEvent() {
		
	}
}
