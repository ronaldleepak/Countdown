//
//  PersistenceController.swift
//  Countdown
//
//  Created by Ronald Lee on 26/2/2023.
//

import Foundation
import CoreData

struct PersistenceController {
	static let shared = PersistenceController()
	
	let container: NSPersistentContainer
	
	static var preview: PersistenceController = {
		let controller = PersistenceController(inMemory: true)
		
		for i in 0...3 {
			let event = Event(context: controller.container.viewContext)
			
			event.name = "Test \(i)"
			event.datetime = Date.now
		}
		
		controller.save()
		
		return controller
	}()
	
	init(inMemory: Bool = false) {
		container = NSPersistentContainer(name: "Model")
		
		if inMemory {
			container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
		}
		
		container.loadPersistentStores { description, error in
			if let error = error {
			   fatalError("Error: \(error.localizedDescription)")
		   }
		}
	}
	
	func save() {
		let context = container.viewContext

		if context.hasChanges {
			do {
				try context.save()
			} catch {
				// Show some error here
			}
		}
	}
}
