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
        
        TabView {
            TheoryHomeView(grades: $grades)
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
            
            RecorderHomeView(timer: Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: {timer in print("")} )  )
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
            Grade(number: 1, percentageCorrect: 80, words: [
                Word(title:"a tempo", definition: "resuming the speed obtained preceding ritardando or accelerando."),
                Word(title:"accelerando", altText: "accel.", definition: "gradually increasing in speed"),
                Word(title:"adagio", definition: "in a leisurely manner; slowly"),
                Word(title:"allegretto", definition: "in a leisurely manner; slowly"),
                Word(title:"allegro", definition: "brisk or rapid in tempo"),
                Word(title:"andante", definition: "moderately slow and even"),
                Word(title:"cantabile", definition: "songlike and flowing in style"),
                Word(title:"crescendo", altText: "cresc.", definition: "force"),
                Word(title:"da capo", altText: "D.C.", definition: "beginning"),
                Word(title:"decrescendo", altText: "decresc.", definition: "gradually reducing force or loudness; diminuendo "),
                Word(title:"diminuendo", altText: "dimin. / dim.", definition: "gradually reducing in force or loudness; decrescendo"),
                Word(title:"dolce", definition: "sweet; soft"),
                Word(title:"forte", altText: "f", definition: "to play loudly"),
                Word(title:"fortissimo", altText: "ff", definition: "to play loudly (louder than forte"),
                Word(title:"fine, al fine", definition: "to repeat sections of a composition either from the beginning (D.C), or the dal segno sign, until the \"Fine\" symbol"),
                Word(title:"legato", definition: "a smooth, graceful style"),
                Word(title:"mezzo forte", altText: "mf", definition: "softer than forte"),
                Word(title:"moderato", definition: "in a moderate tempo"),
                Word(title:"mezzo piano", altText: "mf", definition: "slightly softer than mezzo forte"),
                Word(title:"piano", altText: "p", definition: "quietly /   softly"),
                Word(title:"pianissimo", altText: "pp", definition: "very softly, even more softly than piano"),
                Word(title:"rallentando", altText: "rall.", definition: "a gradual slowing of the tempo"),
                Word(title:"ritardando", altText: "ritard. / rit.", definition: "a gradual slowing of the tempo, or a delay"),
                Word(title:"staccato", altText: "stacc.", definition: "to play in a detached, seperate manner ")]),
            Grade(number: 2, percentageCorrect: 80),
            Grade(number: 3, percentageCorrect: 80),
            Grade(number: 4, percentageCorrect: 80),
            Grade(number: 5, percentageCorrect: 80)]))
    }
}
