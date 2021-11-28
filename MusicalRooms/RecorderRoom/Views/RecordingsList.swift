//
//  RecordingsList.swift
//  MusicalRooms
//
//  Created by sap on 19/11/21.
//

import SwiftUI

struct RecordingsList: View {
    
    let lightBrown: Color = Color(red: 131/255, green: 78/255, blue: 44/255, opacity: 1.0)
    let darkBrown: Color = Color(red: 70/255, green: 27/255, blue: 0, opacity: 1.0)
    let backBrown: Color = Color(red: 211/255, green: 165/255, blue: 109/255)
    
    @State var isEditing = false
    @ObservedObject var audioRecorder: AudioRecorder
    
    var body: some View {
        
        HStack{
           
            Spacer()

            Button{
                withAnimation(.easeInOut){
                    isEditing.toggle()
                }
            }label: {
                Text(isEditing ? "Done" : "Edit")
                        .font(Font.system(size: 18, weight: .semibold, design: .default))
                        .foregroundColor(darkBrown)
                        .multilineTextAlignment(.trailing)
                        .offset(x:-6)
            }
        }
        .padding(.leading, 35)
        .padding(.trailing, 40)
 
        
        if(audioRecorder.recordings.count >= 1){
            List {
                ForEach(audioRecorder.recordings, id: \.createdAt) { recording in
                    RecordingRow(audioURL: recording.fileURL)
                }
                .onDelete(perform: delete)
            }
            .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))
            .listStyle(.plain)
            .padding()
        }else{
            List{
                Text("No recordings")
                    .font(Font.system(size: 18, weight: .bold, design: .default))
                    .foregroundColor(darkBrown)
            }
            .listStyle(.plain)
            .padding()
        }
    }
    
    func delete(at offsets: IndexSet) {
        
        var urlsToDelete = [URL]()
        for index in offsets {
            urlsToDelete.append(audioRecorder.recordings[index].fileURL)
        }
        audioRecorder.deleteRecording(urlsToDelete: urlsToDelete)
    }
}

struct RecordingRow: View {
    
    let lightBrown: Color = Color(red: 131/255, green: 78/255, blue: 44/255, opacity: 1.0)
    let darkBrown: Color = Color(red: 70/255, green: 27/255, blue: 0, opacity: 1.0)
    let backBrown: Color = Color(red: 211/255, green: 165/255, blue: 109/255)
    
    var audioURL: URL
    
    @ObservedObject var audioPlayer = AudioPlayer()
    
    var body: some View {
        
        HStack {
            let fileName = String(audioURL.lastPathComponent)
            Text("\(fileName.replacingOccurrences(of: ".m4a", with: ""))")
                .font(Font.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundColor(darkBrown)
            
            Spacer()
            
            Button{
                !audioPlayer.isPlaying ? self.audioPlayer.startPlayback(audio: self.audioURL) : self.audioPlayer.stopPlayback()
            } label: {
                Text("\(Image(systemName: !audioPlayer.isPlaying ? "play.circle.fill" : "stop.circle.fill"))")
                    .font(Font.system(size: 26, weight: .bold, design: .default))
                    .offset(x: -10)
                    .foregroundColor(lightBrown)
            }
            
        }
    }
}

struct RecordingsList_Previews: PreviewProvider {
    static var previews: some View {
        RecorderHomeView(timer: Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: {timer in print("")}))
    }
}
