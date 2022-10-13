//
//  RecordingsList.swift
//  MusicalRooms
//
//  Created by sap on 19/11/21.
//

import SwiftUI
import AVFoundation

struct RecordingsList: View {

    
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
                } label: {
                    Text(isEditing ? "Done" : "Edit")
                            .font(.system(size: 18, weight: .semibold, design: .default))
                            .foregroundColor(Color("fg"))
                            .multilineTextAlignment(.trailing)
                }

            }
            .padding(.horizontal, 30)

            if(audioRecorder.recordings.count > 0){
                List {
                    ForEach(0..<audioRecorder.recordings.count) { recordingIndex in
                        var recording = audioRecorder.recordings[recordingIndex]
                        RecordingRow(audioURL: recording.fileURL, isExpanded: $expandedRow[recordingIndex])
                    }
                    .onDelete(perform: delete)
                }
                .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))
                .listStyle(.plain)
            }else{
                List{
                    Text("No recordings")
                            .font(.system(size: 18, weight: .bold, design: .default))
                            .foregroundColor(Color("fg"))
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
