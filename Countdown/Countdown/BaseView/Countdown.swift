//
//  Countdown.swift
//  Countdown
//
//  Created by Ronald Lee on 28/2/2023.
//

import SwiftUI

struct Countdown: View {
	let targetDatetime: Date?
	var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	
	@State private var countdownString = ""
	
    var body: some View {
		VStack {
			HStack {
				Text("Day").padding()
				Text("Hour").padding()
				Text("Min").padding()
				Text("Sec").padding()
			}
			HStack {
				Text(countdownString).padding()
			}
		}
		.onReceive(timer) { time in
			countdownString =  CountdownToString(targetDatetime)
		}
    }
}

struct Countdown_Previews: PreviewProvider {
    static var previews: some View {
		Countdown(targetDatetime: Date.now)
    }
}
