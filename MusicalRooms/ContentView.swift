//
//  ContentView.swift
//  MusicalRooms
//
//  Created by sap on 14/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var grades: Grades
    var lightBrown:Color = Color(red: 212/255, green: 177/255, blue: 148/255, opacity: 1.0)

    var body: some View {
        
        TabView{
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
            
            RecorderHomeView()
                .tabItem{
                    Image(systemName: "waveform")
                    Text("Recorder")
                }
            
        }
        .accentColor(Color("primary"))
        .font(Font.body)
        .onAppear{
            UITabBar.appearance().unselectedItemTintColor = UIColor.init(lightBrown)
        }
        
    }
}
