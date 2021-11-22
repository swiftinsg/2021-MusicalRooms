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
    
    let lightBrown: Color = Color(red: 131/255, green: 78/255, blue: 44/255, opacity: 1.0)
    let darkBrown: Color = Color(red: 70/255, green: 27/255, blue: 0, opacity: 1.0)
    let backBrown: Color = Color(red: 211/255, green: 165/255, blue: 109/255)
    
    @State var recordButtonSize: CGFloat = 60
    @State var recordBorderWidth: CGFloat = 3
    @State var recordButtonBorder: CGFloat = 75
    @State var recordButtonRadius: CGFloat = 30
    
    @ObservedObject var audioRecorder = AudioRecorder()
    
    @State var recordingLength = 0
    @State var lengthDisplayed = false
    @State var timer: Timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: {timer in print("")})
    
    @State var isMini: Bool = false
    
    var body: some View {
        
        VStack{
            
            Spacer().frame(height: 20)
            
            Text("Recorder")
                .font(Font.system(size: 28, weight: .bold))
                .padding()
            
            Spacer().frame(height: 20)
            
            
            if !isMini{
                // RECORDING LIST
                RecordingsList(audioRecorder: audioRecorder)
            }
            
            
            if(lengthDisplayed){
                Text("\(String(format: "%.2d", recordingLength / 60)):\(String(format: "%.2d", recordingLength % 60))")
                    .foregroundColor(lightBrown)
                    .font(Font.system(size: 18, weight: .semibold, design: .monospaced))
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
                        .stroke(lightBrown, lineWidth: recordBorderWidth)
                        .frame(width: 70, height: 70, alignment: .center)
                    Rectangle()
                        .fill(lightBrown)
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
