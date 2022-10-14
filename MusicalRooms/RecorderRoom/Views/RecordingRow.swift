//
// RecordingRow.swift
// MusicalRooms
//
// Created by sap on 28/11/21.
//

import Foundation
import SwiftUI
import AVFoundation

struct RecordingRow: View {

    let id = UUID()
    
    var recording: Recording
    var audioURL: URL
    @ObservedObject var audioPlayer: AudioPlayer

    @Binding var isExpanded: Bool

    init(recording: Recording, isExpanded: Binding<Bool>) {
        self.recording = recording
        self.audioURL = recording.fileURL
        self.audioPlayer = AudioPlayer(audioURL: recording.fileURL)
        
        self._isExpanded = isExpanded
    }
    
    var body: some View {
        
        VStack {
            HStack{
                VStack(alignment: .leading){
                    let recordingName = String(recording.fileURL.lastPathComponent).replacingOccurrences(of: ".m4a", with: "")
                    Text(recordingName)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color("fg"))
                        .padding(.vertical, 0.5)

                    Text(getCreationDate(for: audioURL), style: .date)
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(Color("fg"))
                }

                Spacer()

                if isExpanded {
                    //Share audiofile
                    Button{
                        shareAudioFile(audioURL)
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                                .foregroundColor(Color("fg"))
                    }
                    .buttonStyle(PlainButtonStyle())
                } else {
                    Text(fmtDuration(duration: getAudioLength(for: audioURL)))
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(Color("fg"))
                }
            }


            // ----- CONTROLS -----
            var timestamp = audioPlayer.playbackTime
            var duration: TimeInterval = audioPlayer.getDuration()
            var trackPercentage: TimeInterval = audioPlayer.playbackTime/audioPlayer.getDuration()
            let timeStampFmt = fmtDuration(duration: timestamp)
            let durationFmt = fmtDuration(duration: duration)
            
            if (isExpanded){

                HStack{
                    Spacer()
                    
                    Text( "\(timeStampFmt) / \(durationFmt)")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(Color("fg"))
                    
                    Spacer()
                    
                    Button{
                        print(audioPlayer.playbackTime)
                        audioPlayer.setCurrentTime(timestamp-15)
                    } label: {
                        Image(systemName: "gobackward.15")
                        .foregroundColor(Color("fg"))
                    }
                    .buttonStyle(PlainButtonStyle())

                    Button{
                        (audioPlayer.isPlaying ? self.audioPlayer.stopPlayback() : self.audioPlayer.startPlayback())
                        print("Toggle playback")
                    } label: {
                        (audioPlayer.isPlaying ? Image(systemName: "pause.fill") : Image(systemName: "play.fill"))
                        .foregroundColor(Color("fg"))
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.horizontal)

                    Button{
                        audioPlayer.setCurrentTime(timestamp+15)
                    } label: {
                        Image(systemName: "goforward.15")
                                .foregroundColor(Color("fg"))
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    
                    Spacer()

                }
                    .padding(5)
                    .background(Color("secondary"))
                    .cornerRadius(5)

            }

        }
    }
    
    //funcs

    func shareAudioFile(_ url: URL){
        let avc = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
            
        windowScene?.keyWindow?.rootViewController?.present(avc, animated: true, completion: nil)
    }
    
    func fmtDuration(duration: TimeInterval) -> String {
        let minutes = Int(duration / 60)
        let seconds = Int(duration.truncatingRemainder(dividingBy: 60))
        let minutesFmt = String(format: "%02d", minutes)
        let secondsFmt = String(format: "%02d", seconds)
                          
        return "\(minutesFmt):\(secondsFmt)"
    }

}
