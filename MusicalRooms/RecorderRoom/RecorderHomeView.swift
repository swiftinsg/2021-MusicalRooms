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
    
    var body: some View {
        
        NavigationView {
            VStack{
                
                Spacer().frame(height:40)
                
                // RECORDING LIST
                RecordingsList(audioRecorder: audioRecorder)
                
                
                // Record button
                Button{
                    if(self.audioRecorder.recording){
                        self.audioRecorder.stopRecording()
                    }else{
                        self.audioRecorder.startRecording()
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
                .background(.white)
                
            }
            .navigationBarTitle("Recorder")
            .navigationBarItems(trailing: EditButton())
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
    
}
