//
//  RecordingsList.swift
//  MusicalRooms
//
//  Created by sap on 19/11/21.
//

import SwiftUI
import AVFoundation

struct RecordingsList: View {
    
    let lightBrown: Color = Color(red: 131/255, green: 78/255, blue: 44/255, opacity: 1.0)
    let darkBrown: Color = Color(red: 70/255, green: 27/255, blue: 0, opacity: 1.0)
    let backBrown: Color = Color(red: 211/255, green: 165/255, blue: 109/255)
    
    @State var isEditing = false
    @ObservedObject var audioRecorder: AudioRecorder
    @State var expandedRow = [false]
    
    var body: some View {
        VStack{

            HStack{
                Spacer()

                Button{
                    withAnimation(.easeInOut){
                        isEditing.toggle()
                    }
                }label: {
                    Text(isEditing ? "Done" : "Edit")
                            .font(.system(size: 18, weight: .semibold, design: .default))
                            .foregroundColor(darkBrown)
                            .multilineTextAlignment(.trailing)
                            .offset(x:-6)
                }

            }
                    .padding(.horizontal, 30)


            if(audioRecorder.recordings.count > 0){
                List {
                    ForEach(0..<audioRecorder.recordings.count+1){recordingIndex in
                        var recording = audioRecorder.recordings[recordingIndex]
                        RecordingRow(audioURL: recording.fileURL, isExpanded: $expandedRow[recordingIndex])
                    }
                    .onDelete(perform: delete)
                }
                        .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))
                        .listStyle(.plain)
                        .padding()
            }else{
                List{
                    Text("No recordings")
                            .font(.system(size: 18, weight: .bold, design: .default))
                            .foregroundColor(darkBrown)
                }
                .listStyle(.plain)
                .padding()
            }

        }
        .onAppear{ //init
            expandedRow = Array(repeating: false, count: audioRecorder.recordings.count)
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


struct RecordingsList_Previews: PreviewProvider {
    static var previews: some View {
        RecorderHomeView(timer: Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: {timer in print("")}))
    }
}
