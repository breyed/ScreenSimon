import SwiftUI

struct ContentView: View {
	var body: some View {
		ZStack {
			GameButton(startAngle: 180).foregroundColor(.red)
			GameButton(startAngle: 270).foregroundColor(.blue)
			GameButton(startAngle: 90).foregroundColor(.green)
			GameButton(startAngle: 0).foregroundColor(.yellow)
		}
	}
}

struct GameButton: Shape {
	let startAngle: CGFloat

	func path(in rect: CGRect) -> Path {
		var p = Path()
		p.addArc(center: .init(x: 100, y: 100), radius: 50, startAngle: .degrees(startAngle), endAngle: .degrees(startAngle + 90), clockwise: false)
		return p.strokedPath(.init(lineWidth: 20))
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
