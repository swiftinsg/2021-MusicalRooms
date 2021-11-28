//
//  Tunings.swift
//  MusicalRooms
//
//  Created by Chelsea Ling on 26/11/21.
//

import Foundation

struct Tuning: Identifiable, Hashable {
    var id = UUID()
    
    var name: String
    var notes: String
    
}
