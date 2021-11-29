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

    let lightBrown: Color = Color(red: 131/255, green: 78/255, blue: 44/255, opacity: 1.0)
    let darkBrown: Color = Color(red: 70/255, green: 27/255, blue: 0, opacity: 1.0)
    let backBrown: Color = Color(red: 211/255, green: 165/255, blue: 109/255)

    @State var audioURL: URL
    @ObservedObject var audioPlayer = AudioPlayer()

    @Binding var isExpanded: Bool
    @State var nameEditorText = "placeholder"

    @State var sliderOffset: CGFloat = 0.0
    @State var lastSliderOffset: CGFloat = 0.0


    var body: some View {

        VStack (spacing:4){
            HStack{
                VStack(alignment: .leading){
                    let fileName = String(audioURL.lastPathComponent)
                    TextEditor(text: $nameEditorText)
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(darkBrown)
                            .onChange(of: nameEditorText){text in
                                //renameAudioFile(nameEditorText)
                            }

                    Text(getCreationDate(for: audioURL), style: .date)
                            .font(.system(size: 12, weight: .semibold, design: .default))
                            .foregroundColor(lightBrown)
                }

                Spacer()

                if isExpanded{
                    //Share audiofile
                    Button{
                        shareAudioFile(audioURL)
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                                .foregroundColor(darkBrown)
                    }
                }else{
                    Text("\(getAudioLength(for: audioURL))")
                            .font(.system(size: 12, weight: .semibold, design: .default))
                            .foregroundColor(lightBrown)
                }
            }

            Spacer().frame(height:25)



            // ----- CONTROLS -----
            let timestamp: TimeInterval = audioPlayer.getCurrentTime()
            let duration: TimeInterval = audioPlayer.getDuration()
            let trackPercentage: TimeInterval = audioPlayer.getCurrentTime()/audioPlayer.getDuration()

            if (isExpanded){

                ZStack{ //SLIDER
                    RoundedRectangle(cornerRadius: 3)
                            .fill(LinearGradient(gradient: Gradient(stops: [
                                .init(color: darkBrown, location: trackPercentage),
                                .init(color: lightBrown, location: trackPercentage)
                            ]), startPoint: .leading, endPoint: .trailing))
                            .frame(maxWidth: .infinity)
                            .frame(height: 6)
                    Circle()
                            .frame(height: 10)
                            .foregroundColor(darkBrown)
                            .offset(x: -(UIScreen.main.bounds.width/2-30) + sliderOffset)
                            .gesture(DragGesture()
                                    .onChanged{value in
                                        sliderOffset = CGFloat(max(0, min( UIScreen.main.bounds.width-60, lastSliderOffset+value.translation.width )))
                                        let newTrack = max(0, min(1, sliderOffset / UIScreen.main.bounds.width-60 ))
                                        withAnimation(.easeInOut(duration: 0.2)){
                                            audioPlayer.setCurrentTime(newTrack * audioPlayer.getDuration())
                                        }
                                    }
                                    .onEnded{value in
                                        lastSliderOffset = sliderOffset
                                    }
                            )
                }

                HStack{
                    let formatter = DateComponentsFormatter()
                    Text(formatter.string(from: timestamp)!)
                            .font(.system(size: 12, weight: .semibold, design: .default))
                            .foregroundColor(lightBrown)

                    Spacer().frame(maxWidth: .infinity)

                    let timeToEnd = duration-timestamp
                    Text("-\(formatter.string(from: timeToEnd)!)")
                            .font(.system(size: 12, weight: .semibold, design: .default))
                            .foregroundColor(lightBrown)
                }
                Spacer().frame(height:10)

                HStack{
                    Spacer()
                    Button{
                        audioPlayer.setCurrentTime(timestamp-15)
                    } label: {
                        Image(systemName: "gobackward.15")
                        .foregroundColor(darkBrown)
                    }

                    Button{
                        (audioPlayer.isPlaying ? self.audioPlayer.stopPlayback() : self.audioPlayer.startPlayback(audio: audioURL))
                    } label: {
                        (audioPlayer.isPlaying ? Image(systemName: "pause.fill") : Image(systemName: "play.fill"))
                        .foregroundColor(darkBrown)
                    }
                    .padding(.horizontal)

                    Button{
                        audioPlayer.setCurrentTime(timestamp+15)
                    } label: {
                        Image(systemName: "goforward.15")
                                .foregroundColor(darkBrown)
                    }

                }

            }

        }
        .onAppear{ //init
            self.nameEditorText = String(audioURL.lastPathComponent).replacingOccurrences(of: ".m4a", with: "")
        }
        .onTapGesture{
            isExpanded.toggle()
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
        UIApplication.shared.windows.first?
        .rootViewController?.present(avc, animated: true, completion: nil)
    }

}
