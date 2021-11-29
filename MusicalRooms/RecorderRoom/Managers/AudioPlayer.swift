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
    
    var isPlaying = false {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    @State var audioPlayer: AVAudioPlayer!
    
    func startPlayback (audio: URL) {
        let playbackSession = AVAudioSession.sharedInstance()
        
        do {
            try playbackSession.setCategory(.playAndRecord, mode: .default)
            try playbackSession.overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
        } catch {
            print("Playing over the device's speakers failed")
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audio)
            audioPlayer.delegate = self
            audioPlayer.play()
            isPlaying = true
        } catch {
            print("Playback failed.")
        }
    }
    
    func stopPlayback() {
        audioPlayer.stop()
        isPlaying = false
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            isPlaying = false
        }
    }

    func getCurrentTime() -> TimeInterval{
        (audioPlayer != nil && audioPlayer.currentTime != nil) ? audioPlayer.currentTime : 0.0
    }
    func getDuration() -> TimeInterval{
        (audioPlayer != nil && audioPlayer.duration != nil) ? audioPlayer.duration : 0.0
    }
    func setCurrentTime(_ time: TimeInterval){
        audioPlayer.currentTime = time
    }
}