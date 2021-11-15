//
//  ContentView.swift
//  MusicalRooms
//
//  Created by sap on 14/11/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView{
            TheoryHomeView()
                .tabItem{
                    Image(systemName: "rectangle.and.pencil.and.ellipsis")
                    Text("Theory")
                }
            ReadingHomeView()
                .tabItem{
                    Image(systemName: "music.note.list")
                    Text("Sightreading")
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
            
        }
        .preferredColorScheme(.light)
        .accentColor(Color.brown)
        
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
