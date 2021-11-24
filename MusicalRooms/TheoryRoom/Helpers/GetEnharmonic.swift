//
//  GetEnharmonic.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 24/11/21

import Foundation

func getEnharmonic(_ note: String) -> String {
    switch note {
    case "C#":
        return "D♭"
    case "D#":
        return "E♭"
    case "F#":
        return "G♭"
    case "G#":
        return "A♭"
    case "A#":
        return "B♭"
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
