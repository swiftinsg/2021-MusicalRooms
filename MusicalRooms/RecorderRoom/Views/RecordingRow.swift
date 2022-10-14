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

    @State var audioURL: URL
    @ObservedObject var audioPlayer: AudioPlayer

    @Binding var isExpanded: Bool
    @State var nameEditorText = "placeholder"

    @State var sliderOffset: CGFloat = 0.0
    @State var lastSliderOffset: CGFloat = 0.0

    var body: some View {
        
        VStack {
            HStack{
                VStack(alignment: .leading){
                    let fileName = String(audioURL.lastPathComponent)
                    Text(nameEditorText)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color("fg"))
                        .padding(.vertical, 0.5)

                    Text(getCreationDate(for: audioURL), style: .date)
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(Color("fg"))
                }

                Spacer()

                if isExpanded{
                    //Share audiofile
                    Button{
                        shareAudioFile(audioURL)
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                                .foregroundColor(Color("fg"))
                    }
                    .buttonStyle(PlainButtonStyle())
                }else{
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
        .onAppear{ //init
            self.nameEditorText = String(audioURL.lastPathComponent).replacingOccurrences(of: ".m4a", with: "")
        }
    }
    
    //funcs

    func renameAudioFile(_ newName: String){
        if(nameEditorText.count < 1){
            nameEditorText = String(audioURL.lastPathComponent).replacingOccurrences(of: ".m4a", with: "")
        }
        do{
            let newURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(newName + ".m4a")
            try FileManager.default.moveItem(at: audioURL, to: newURL)
            self.audioURL = newURL
        }catch{
            print(error)
        }
    }

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
