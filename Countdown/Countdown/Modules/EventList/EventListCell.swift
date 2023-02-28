//
//  EventListCellView.swift
//  Countdown
//
//  Created by Ronald Lee on 26/2/2023.
//

import SwiftUI

struct EventListCell: View {
	let event: Event
//	var delegate: EventListViewDelegate?
	
    var body: some View {
		VStack() {
			NavigationLink {
				EventDetail(event: event)
			} label: {
				Text(event.name!)
			}
		}
		.listRowBackground(colorWithHexString(event.colorHex))
    }
}

struct EventListCell_Previews: PreviewProvider {
    static var previews: some View {
		let event = Event(context: PersistenceController.preview.container.viewContext)
		
		event.name = "Test"
		event.datetime = Date.now
		event.colorHex = "#22FFFF"
		
		return EventListCell(event: event)
    }
}
