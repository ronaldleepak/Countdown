//
//  EventListView.swift
//  Countdown
//
//  Created by Ronald Lee on 26/2/2023.
//

import SwiftUI
//
//protocol EventListViewDelegate {
//	func showDetail(_ eventId: UUID)
//}

//struct EventListView: View, EventListViewDelegate {
struct EventList: View {
	@FetchRequest(sortDescriptors: []) var events: FetchedResults<Event>
	
//	func showDetail(_ eventId: UUID) {
//		// show detail
//		print("Show detail")
//	}
	
    var body: some View {
		List(events) { event in
//			EventListCellView(event: event, delegate: self)
			EventListCell(event: event)
		}
		.navigationTitle("Countdown")
		.toolbar {
			NavigationLink("Add") {
				EventCreate()
			}
		}
		.listStyle(DefaultListStyle())
    }
}

struct EventList_Previews: PreviewProvider {
    static var previews: some View {
		EventList().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
