//
//  Words.swift
//  MusicalRooms
//
//  Created by Chelsea Ling on 18/11/21.
//

import Foundation

struct Word: Identifiable {
    var id = UUID()
    
    var title: String
    var isTapped = false
}
