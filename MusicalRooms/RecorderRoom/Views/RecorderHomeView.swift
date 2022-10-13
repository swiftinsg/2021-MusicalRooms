//
//  RecorderHomeView.swift
//  MusicalRooms
//
//  Created by sap on 18/11/21.
//

import SwiftUI
import AVFoundation
import Combine
import Subsonic

struct RecorderHomeView: View {

    
    @State var recordButtonSize: CGFloat = 60
    @State var recordBorderWidth: CGFloat = 3
    @State var recordButtonBorder: CGFloat = 75
    @State var recordButtonRadius: CGFloat = 30
    
    @ObservedObject var audioRecorder = AudioRecorder()
    
    @State var recordingLength = 0
    @State var lengthDisplayed = false
    @State var timer: Timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: {timer in print("")})
    
    var body: some View {

        NavigationView {
            VStack{

                Spacer().frame(height: 20)

                RecordingsList(audioRecorder: audioRecorder)

                if(lengthDisplayed){
                    Text("\(String(format: "%.2d", recordingLength / 60)):\(String(format: "%.2d", recordingLength % 60))")
                            .foregroundColor(Color("fg"))
                            .font(.system(size: 18, weight: .semibold, design: .monospaced))
                            .offset(y: -100)
                }

                // Record button
                Button{
                    if(self.audioRecorder.recording){
                        stopRecorder()
                    }else{
                        self.audioRecorder.startRecording()
                        startRecorder()
                    }
                } label: {
                    ZStack{
                        Circle()
                                .stroke(Color("primary"), lineWidth: recordBorderWidth)
                                .frame(width: 70, height: 70, alignment: .center)
                        Rectangle()
                                .fill(Color("primary"))
                                .frame(width: recordButtonSize, height: recordButtonSize, alignment: .center)
                                .cornerRadius(recordButtonRadius)
                    }
                }.offset(y:-90)
                        .onChange(of: audioRecorder.recording, perform: {isRecording in //Button indicates recording or not
                            if(isRecording){
                                withAnimation(.easeInOut(duration: 0.2)){
                                    recordButtonSize = 30
                                    recordBorderWidth = 5
                                    recordButtonBorder = 90
                                    recordButtonRadius = 8
                                }
                            }else{
                                withAnimation(.easeInOut(duration: 0.2)){
                                    recordButtonSize = 60
                                    recordBorderWidth = 3
                                    recordButtonBorder = 75
                                    recordButtonRadius = 30
                                }
                            }
                        })

            }.navigationBarTitle("Recordings")
        }
    }
    
    
    
    
    //funcs
    
    func delete(at offsets: IndexSet) {
        
        var urlsToDelete = [URL]()
        for index in offsets {
            urlsToDelete.append(audioRecorder.recordings[index].fileURL)
        }
        audioRecorder.deleteRecording(urlsToDelete: urlsToDelete)
    }
    
    func startRecorder(){
        self.audioRecorder.startRecording()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {timer in
            recordingLength += 1
        })
        lengthDisplayed = true
    }
    func stopRecorder(){
        self.audioRecorder.stopRecording()
        self.timer.invalidate()
        recordingLength = 0
        lengthDisplayed = false
    }
    

    
}


struct RecorderHomeView_Previews: PreviewProvider {
    static var previews: some View {
        RecorderHomeView()
    }
}
