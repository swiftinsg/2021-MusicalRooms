//
//  MusicalRoomsApp.swift
//  MusicalRooms
//
//  Created by sap on 14/11/21.
//

import SwiftUI

@main
struct MusicalRoomsApp: App {
    
    @State var grades = [
        Grade(number: 1, percentageCorrect: 0),
        Grade(number: 2, percentageCorrect: 0),
        Grade(number: 3, percentageCorrect: 0),
        Grade(number: 4, percentageCorrect: 0),
        Grade(number: 5, percentageCorrect: 0)]
    
    var body: some Scene {
        WindowGroup {
            ContentView(grades: $grades)
        }
    }
}

