//
//  BottomButtonView.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 18/11/21.
//

import SwiftUI
import AVFoundation

struct BottomButtonView: View {
    
    @Binding var notes: [Note]
    @State var audioPlayer: AVAudioPlayer!
    @State var isOn = false
    
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "tuningfork")
                    .font(Font.title)
                    .frame(width: 80, height: 80, alignment: .center)
                    .foregroundColor(Color("darkBrown"))
                    .background(Color("lightBrown"))
                    .cornerRadius(20)
                    .offset(x: -40)
            }
            
            Button {
                print(notes)
                var selectedNotePath = ""
                for note in notes {
                    if note.isSelected {
                        selectedNotePath = Bundle.main.path(forResource: note.name, ofType: "mp3")!
                    } else {
                        
                    }
                }
                let url = URL(string: selectedNotePath)!
                audioPlayer = try? AVAudioPlayer(contentsOf: url)
                if isOn { audioPlayer.stop() }
                else { audioPlayer.play() }
                
            } label: {
                Image(systemName: "speaker.wave.3")
                    .font(Font.title)
                    .frame(width: 80, height: 80, alignment: .center)
                    .foregroundColor(Color("darkBrown"))
                    .background(Color("lightBrown"))
                    .cornerRadius(20)
                    .offset(x: 40)
            }
        }
            .frame(width: 350, height: 120, alignment: .center)
    }
}

struct BottomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BottomButtonView(notes: .constant([
            Note(name: "C"),
            Note(name: "D"),
            Note(name: "E"),
            Note(name: "F"),
            Note(name: "G"),
            Note(name: "A"),
            Note(name: "B"),
            Note(name: "C#"),
            Note(name: "D#"),
            Note(name: "F#"),
            Note(name: "G#"),
            Note(name: "A#")]))
    }
}
