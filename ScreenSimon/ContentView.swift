import SwiftUI

struct ContentView: View {
	var body: some View {
		ZStack {
			GameButton(startFraction: 0.5, color: .red)
			GameButton(startFraction: 0.75, color: .blue)
			GameButton(startFraction: 0.25, color: .green)
			GameButton(startFraction: 0, color: .yellow)
		}
	}

	private func GameButton(startFraction: CGFloat, color: Color) -> some View {
		Circle()
			.trim(from: startFraction, to: startFraction + 0.25)
			.stroke(color, style: .init(lineWidth: 100))
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
