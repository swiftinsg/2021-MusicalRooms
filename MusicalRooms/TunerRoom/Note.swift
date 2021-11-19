//
//  Note.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 18/11/21.
//

import Foundation

struct Note: Identifiable, Equatable {
    var id = UUID()
    
    var name: String
    var isSelected: Bool = false
    var hertz: Float
}
