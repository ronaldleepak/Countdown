//
//  CountdownApp.swift
//  Countdown
//
//  Created by Ronald Lee on 26/2/2023.
//

import SwiftUI

@main
struct CountdownApp: App {
	let persistenceController = PersistenceController.shared
	@Environment(\.scenePhase) var scenePhase
	@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
	
    var body: some Scene {
        WindowGroup {
			NavigationView {
            	EventList().environment(\.managedObjectContext, persistenceController.container.viewContext)
			}
        }
		.onChange(of: scenePhase) { _ in
			persistenceController.save()
		}
    }
	
	// here to implement notification?
	
}
