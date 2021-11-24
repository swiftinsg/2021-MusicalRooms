//
//  ContentView.swift
//  MusicalRooms
//
//  Created by sap on 14/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var grades: [Grade]
    var lightBrown:Color = Color(red: 131/255, green: 78/255, blue: 44/255, opacity: 1.0)
    var darkBrown:Color = Color(red: 70/255, green: 27/255, blue: 0, opacity: 1.0)

    var body: some View {
        
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in print("") }
        
        TabView {
            TheoryHomeView(grades: $grades)
                .tabItem{
                    Image(systemName: "rectangle.and.pencil.and.ellipsis")
                    Text("Theory")
                }

            TunerHomeView()
                .tabItem{
                    Image(systemName: "tuningfork")
                    Text("Tuner")
                }

            MetronomeHomeView()
                .tabItem{
                    Image(systemName: "metronome")
                    Text("Metronome")
                }
            
            RecorderHomeView(timer: timer)
                .tabItem{
                    Image(systemName: "waveform")
                    Text("Recorder")
                }
            
        }
        .accentColor(darkBrown)
        .font(Font.body)
        .onAppear{
            UITabBar.appearance().unselectedItemTintColor = UIColor.init(lightBrown)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(grades: .constant([
            Grade(number: 1, percentageCorrect: 80),
            Grade(number: 2, percentageCorrect: 80),
            Grade(number: 3, percentageCorrect: 80),
            Grade(number: 4, percentageCorrect: 80),
            Grade(number: 5, percentageCorrect: 80)]))
    }
}
