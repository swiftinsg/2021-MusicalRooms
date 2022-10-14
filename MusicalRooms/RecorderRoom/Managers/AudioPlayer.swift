//
//  AudioPlayer.swift
//  MusicalRooms
//
//  Created by sap on 19/11/21.
//

import Foundation
import SwiftUI
import Combine
import AVFoundation

class AudioPlayer: NSObject, ObservableObject, AVAudioPlayerDelegate {
    
    let objectWillChange = PassthroughSubject<AudioPlayer, Never>()
    @Published var audioPlayer: AVAudioPlayer!
    
    @Published var playbackTime = TimeInterval(0.0)
    var timer: Timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: {timer in print("")})
    
    var isPlaying = false {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    init(audioURL: URL) {
        super.init()
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
            audioPlayer.delegate = self
        } catch {
            print("Playback failed")
        }
    }
    
    func startPlayback () {
        let playbackSession = AVAudioSession.sharedInstance()
        
        do {
            try playbackSession.setCategory(.playAndRecord, mode: .default)
            try playbackSession.overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
        } catch {
            print("Playing over the device's speakers failed")
        }
        
        do {
            audioPlayer.play()
            isPlaying = true
        } catch {
            print("Playback failed.")
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            self.playbackTime = self.audioPlayer.currentTime
            self.objectWillChange.send(self)
        }
    }
    
    func stopPlayback() {
        audioPlayer.stop()
        isPlaying = false
        self.timer.invalidate()
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            isPlaying = false
        }
    }

    func getDuration() -> TimeInterval{
        (audioPlayer != nil && audioPlayer.duration != nil) ? audioPlayer.duration : 0.0
    }
    func setCurrentTime(_ time: TimeInterval){
        audioPlayer.currentTime = time
    }
}
