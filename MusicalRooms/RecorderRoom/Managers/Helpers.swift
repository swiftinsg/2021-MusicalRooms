//
//  Helpers.swift
//  MusicalRooms
//
//  Created by sap on 19/11/21.
//

import Foundation
import AVFoundation

func getCreationDate(for file: URL) -> Date {
    if let attributes = try? FileManager.default.attributesOfItem(atPath: file.path) as [FileAttributeKey: Any],
        let creationDate = attributes[FileAttributeKey.creationDate] as? Date {
        return creationDate
    } else {
        return Date()
    }
}

func getAudioLength(for file: URL) -> TimeInterval {
    let audioAsset = AVURLAsset(url: file)
    return audioAsset.duration.seconds
}

