//
//  AudioRecorder.swift
//  MusicalRooms
//
//  Created by sap on 19/11/21.
//

import Foundation
import SwiftUI
import AVFoundation
import Combine

class AudioRecorder: NSObject,ObservableObject {
    
    override init() {
        super.init()
        fetchRecordings()
    }
    
    let objectWillChange = PassthroughSubject<AudioRecorder, Never>()
    var audioRecorder: AVAudioRecorder!
    @Published var recordings = [Recording]()

    var recording = false {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    func getNewRecordingName() -> String{
        let prefix = "Recording "
        let newRecordingNames = recordings.map {
            $0.fileURL.lastPathComponent
        }.filter {
            $0.starts(with: prefix)
        }

        var iIndex = 1
        var availNameFound = false
        while (!availNameFound) {
            print(newRecordingNames.contains("\(prefix)\(iIndex).m4a"))
            if !newRecordingNames.contains("\(prefix)\(iIndex).m4a") {
                availNameFound = true
            } else {
                iIndex += 1
            }
        }
        
        return "\(prefix)\(iIndex)"
    }
    
    func startRecording() {
        
        let recordingSession = AVAudioSession.sharedInstance()
        
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
        } catch {
            print("Failed to set up recording session")
        }
        
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let audioFilename = documentPath.appendingPathComponent("\(getNewRecordingName()).m4a")
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.record()

            recording = true
        } catch {
            print("Could not start recording")
        }
    }
    
    func stopRecording() {
        audioRecorder.stop()
        recording = false
        
        fetchRecordings()
    }
    
    func fetchRecordings() {
        recordings.removeAll()
        
        var newRecordings: [Recording] = []
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let directoryContents = try! fileManager.contentsOfDirectory(at: documentDirectory, includingPropertiesForKeys: nil)
        for audio in directoryContents {
            let recording = Recording(fileURL: audio, createdAt: getCreationDate(for: audio))
            newRecordings.append(recording)
        }
        newRecordings.sort(by: { $0.createdAt.compare($1.createdAt) == .orderedAscending})
        
        recordings = newRecordings
        objectWillChange.send(self)
    }
    
    func deleteRecording(at indexes: IndexSet) {
        for i in indexes {
            do {
                try FileManager.default.removeItem(at: recordings[i].fileURL)
            } catch {
                print("File could not be deleted.")
            }
        }
        recordings.remove(atOffsets: indexes)
    }
}
