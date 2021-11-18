//
//  GetEnharmonic.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 16/11/21.
//

import Foundation

func getEnharmonic(_ note: String) -> String {
    switch note {
    case "C#":
        return "Db"
    case "D#":
        return "Eb"
    case "F#":
        return "Gb"
    case "G#":
        return "Ab"
    case "A#":
        return "Bb"
    default:
        return "nil"
    }
}

func conversion(_ note: String) -> String {
    switch note {
    case "Csharp":
        return "C#"
    case "Dsharp":
        return "D#"
    case "Fsharp":
        return "F#"
    case "Gsharp":
        return "G#"
    case "Asharp":
        return "A#"
    default:
        return "nil"
    }
    
}
