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

    
    @State var recordButtonSize: CGFloat = 48
    @State var recordBorderWidth: CGFloat = 2
    @State var recordButtonBorder: CGFloat = 65
    @State var recordButtonRadius: CGFloat = 30
    
    @ObservedObject var audioRecorder = AudioRecorder()
    
    @State var recordingLength = 0
    @State var lengthDisplayed = false
    @State var timer: Timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: {timer in print("")})
    
    var body: some View {

        NavigationView {
            VStack{

                RecordingsList(audioRecorder: audioRecorder)
                    .padding(.bottom, 20)

                if(lengthDisplayed){
                    Text("\(String(format: "%.2d", recordingLength / 60)):\(String(format: "%.2d", recordingLength % 60))")
                            .foregroundColor(Color("fg"))
                            .font(.system(size: 16, weight: .semibold))
                            .offset(y: -20)
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
                                .frame(width: 55, height: 55, alignment: .center)
                        Rectangle()
                                .fill(Color("primary"))
                                .frame(width: recordButtonSize, height: recordButtonSize, alignment: .center)
                                .cornerRadius(recordButtonRadius)
                    }
                }
                .offset(y: -15)
                .onChange(of: audioRecorder.recording, perform: {isRecording in //Button indicates recording or not
                    if(isRecording){
                        withAnimation(.easeInOut(duration: 0.2)){
                            recordButtonSize = 30
                            recordBorderWidth = 3
                            recordButtonBorder = 90
                            recordButtonRadius = 8
                        }
                    }else{
                        withAnimation(.easeInOut(duration: 0.2)){
                            recordButtonSize = 48
                            recordBorderWidth = 2
                            recordButtonBorder = 65
                            recordButtonRadius = 30
                        }
                    }
                })

            }.navigationBarTitle("Recordings")
        }
    }
    
    
    
    
    //funcs
    
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
