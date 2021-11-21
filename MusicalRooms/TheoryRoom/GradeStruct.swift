//
//  GradeStruct.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 15/11/21.
//

import Foundation

struct Grade: Identifiable, Equatable {
    var id = UUID()
    
    var number: Int
    var percentageCorrect: Double
    var words: [Word] = [Word(title: "adagio", definition: "slowly")]
}
