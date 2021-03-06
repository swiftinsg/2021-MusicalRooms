//
//  WordStruct.swift
//  MusicalRooms
//
//  Created by Chelsea Ling on 18/11/21.
//

import Foundation

struct Word: Identifiable, Equatable {
    var id = UUID()
    
    var title: String
    var altText: String?
    var definition: String
    var isTapped = false
}
