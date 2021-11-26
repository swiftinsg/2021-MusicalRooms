//
//  GetTempoName.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 26/11/21.
//

import Foundation

func tempoName(bpm: Int) -> String {
    if bpm < 20 { return "Larghissimo" }
    else if bpm < 40 { return "Gravo" }
    else if bpm < 50 { return "Lento" }
    else if bpm < 55 { return "Largo" }
    else if bpm < 65 { return "Adagio" }
    else if bpm < 70 { return "Adagietto" }
    else if bpm < 80 { return "Andante" }
    else if bpm < 100 { return "Moderato" }
    else if bpm < 110 { return "Allegretto" }
    else if bpm < 130 { return "Allegro" }
    else if bpm < 140 { return "Vivace" }
    else if bpm < 180 { return "Presto" }
    else { return "Prestissimo" }
}
