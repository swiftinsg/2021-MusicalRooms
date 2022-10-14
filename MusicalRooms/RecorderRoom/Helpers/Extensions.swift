//
//  Extensions.swift
//  MusicalRooms
//
//  Created by sap on 18/11/21.
//

import Foundation
import AVFoundation
import SwiftUI


extension Date{
    func toString(dateFormat format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}