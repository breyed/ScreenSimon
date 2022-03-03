import SwiftUI

let colors: [Color] = [.yellow, .green, .red, .blue]
let sequence = [3, 1, 2, 0, 1, 1, 2, 0, 0, 3]

struct ContentView: View {
	@State var isPlaying = false
	@State var start = Date()

	var body: some View {
		TimelineView(.periodic(from: start, by: 1)) { timeline in
			let sequenceIndex = Int(start.distance(to: timeline.date))
			let activeId = sequenceIndex < sequence.count ? sequence[sequenceIndex] : -1
			
			ZStack {
				// Game buttons
				ForEach(0 ..< 4) { id in
					GameButton(id: id, activeId: activeId)
				}

				// Center text
				VStack(spacing: 10) {
					Text("Simon")
						.font(.largeTitle)
					Button(isPlaying ? "Pause" : "Play") {}
						.buttonBorderShape(.capsule)
						.buttonStyle(.borderedProminent)
					Text("Says")
						.font(.largeTitle)
				}
			}
			.padding()
		}
	}

	private func GameButton(id: Int, activeId: Int) -> some View {
		let startFraction = CGFloat(id) * 0.25
		return Button(action: {}) { Circle() }
			.clipShape(Circle()
				.trim(from: startFraction, to: startFraction + 0.25)
				.stroke(style: .init(lineWidth: 180))
			)
			.foregroundColor(colors[id])
			.opacity(id == activeId ? 1 : 0.3)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
