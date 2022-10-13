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
    @ObservedObject var audioPlayer = AudioPlayer()

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
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(Color("fg"))
                        .padding(.vertical, 3)

                    Text(getCreationDate(for: audioURL), style: .date)
                            .font(.system(size: 12, weight: .semibold, design: .default))
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
                }else{
                    Text(String(format: "%.1f", getAudioLength(for: audioURL)) + "s")
                            .font(.system(size: 12, weight: .semibold, design: .default))
                            .foregroundColor(Color("fg"))
                }
            }


            // ----- CONTROLS -----
            let timestamp: TimeInterval = audioPlayer.getCurrentTime()
            let duration: TimeInterval = audioPlayer.getDuration()
            let trackPercentage: TimeInterval = audioPlayer.getCurrentTime()/audioPlayer.getDuration()
            let timeStampStr = String(format: "%.1f", timestamp)
            let durationStr = String(format: "%.1f", duration)
            
            if (isExpanded){

                HStack{
                    Spacer()
                    
                    Text( "\(timeStampStr)/\(durationStr)")
                        .font(.system(size: 12, weight: .semibold, design: .default))
                        .foregroundColor(Color("fg"))
                    
                    Spacer()
                    
                    Button{
                        audioPlayer.setCurrentTime(timestamp-15)
                    } label: {
                        Image(systemName: "gobackward.15")
                        .foregroundColor(Color("fg"))
                    }

                    Button{
                        (audioPlayer.isPlaying ? self.audioPlayer.stopPlayback() : self.audioPlayer.startPlayback(audio: audioURL))
                    } label: {
                        (audioPlayer.isPlaying ? Image(systemName: "pause.fill") : Image(systemName: "play.fill"))
                        .foregroundColor(Color("fg"))
                    }
                    .padding(.horizontal)

                    Button{
                        audioPlayer.setCurrentTime(timestamp+15)
                    } label: {
                        Image(systemName: "goforward.15")
                                .foregroundColor(Color("fg"))
                    }
                    Spacer()

                }
                    .padding(5)
                    .background(Color("secondary"))
                    .cornerRadius(7.5)

            }

        }
        .onAppear{ //init
            self.nameEditorText = String(audioURL.lastPathComponent).replacingOccurrences(of: ".m4a", with: "")
        }
        .onTapGesture{
            withAnimation {
                isExpanded = true
            }
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

}
