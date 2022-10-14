//
//  RecordingsList.swift
//  MusicalRooms
//
//  Created by sap on 19/11/21.
//

import SwiftUI
import AVFoundation

struct RecordingsList: View {
    
    @Namespace private var listAnimation

    @State var isEditing = false
    @ObservedObject var audioRecorder: AudioRecorder
    @State var expandedRow = Array(repeating: false, count: 1000) //UI updates before backend changes can take effect.
    
    init(audioRecorder: AudioRecorder) {
        self.audioRecorder = audioRecorder
        expandedRow = Array(repeating: false, count: audioRecorder.recordings.count+2)
    }
    
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
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(Color("fg"))
                            .multilineTextAlignment(.trailing)
                            .padding(.horizontal)
                }

            }
            if(audioRecorder.recordings.count > 0){
                List {
                    ForEach(audioRecorder.recordings, id:\.self) { recording in
                        let recordingIndex = audioRecorder.recordings.firstIndex(of: recording)!
                        RecordingRow(recording: recording, isExpanded: $expandedRow[recordingIndex])
                            .onTapGesture {
                                if (isEditing) { return }
                                withAnimation {
                                    expandedRow = Array(repeating: false, count: 1000)
                                    expandedRow[recordingIndex] = true

                                }
                            }
                    }
                    .onDelete {indexSet in
                        audioRecorder.deleteRecording(at: indexSet)
                    }
                }
                .refreshable {
                    audioRecorder.fetchRecordings()
                }
                .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))
                .listStyle(.plain)
            }else{
                List{
                    Text("No recordings")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color("fg"))
                }
                .listStyle(.plain)
                .padding()
            }

        }
        .onAppear{ //init
            expandedRow = Array(repeating: false, count: 1000)
        }
    }
}


struct RecordingsList_Previews: PreviewProvider {
    static var previews: some View {
        RecorderHomeView(timer: Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: {timer in print("")}))
    }
}
