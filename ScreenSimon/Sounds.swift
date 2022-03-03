import AudioToolbox

class SoundPlayer: ObservableObject {
	private var player: MusicPlayer!
	
	init() {
		NewMusicPlayer(&player)
	}
	
	deinit {
		DisposeMusicPlayer(player)
	}
	
	func playTone(note: Int) {
		let octave = 6
		let absoluteNote = octave * 12 + note

		var sequence: MusicSequence!; NewMusicSequence(&sequence)
		var track: MusicTrack?; MusicSequenceNewTrack(sequence!, &track)
		var noteMessage = MIDINoteMessage(channel: 0, note: UInt8(absoluteNote), velocity: 64, releaseVelocity: 0, duration: 0.25)
		MusicTrackNewMIDINoteEvent(track!, MusicTimeStamp(0), &noteMessage)
		MusicPlayerStop(player)
		MusicPlayerSetSequence(player, sequence)
		MusicPlayerStart(player)
	}
}
