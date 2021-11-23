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
        Grade(number: 1, percentageCorrect: 0, words:
            [Word(title:"a tempo", definition: "resuming the speed obtained preceding ritardando or accelerando."),
            Word(title:"accelerando", altText: "accel.", definition: "gradually increasing in speed"),
            Word(title:"adagio", definition: "in a leisurely manner; slowly"),
            Word(title:"allegretto", definition: "in a leisurely manner; slowly"),
            Word(title:"allegro", definition: "brisk or rapid in tempo"),
            Word(title:"andante", definition: "moderately slow and even"),
            Word(title:"cantabile", definition: "songlike and flowing in style"),
            Word(title:"crescendo", altText: "cresc.", definition: "force"),
            Word(title:"da capo", altText: "D.C.", definition: "(from the) beginning"),
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
        Grade(number: 2, percentageCorrect: 0, words:
                [Word(title: "alla marcia", definition: "like a march"),
                 Word(title: "allargando", definition: "in a slower and broader manner"),
                 Word(title: "con moto", definition: "with movement, in a spirited manner"),
                 Word(title: "con, col", definition: "\"with\""),
                 Word(title: "dal segno", altText: "D.S", definition: "to repeat the phrase marked by the D.S sign (segno)"),
                 Word(title: "e, ed", definition: "\"and\""),
                 Word(title: "espressivo", altText: "espress.", definition: "with expression, expressive"),
                 Word(title: "fortepiano", altText: "fp", definition: "to play loudly, then immediately soft"),
                 Word(title: "grave", definition: "with a solemn, grave expression; the slowest tempo"),
                 Word(title: "grazioso", definition: "gracefully; with grace"),
                 Word(title: "largo", definition: "broadly; slowly; slower than lento"),
                 Word(title: "lento", definition: "slowly; slower than adagio"),
                 Word(title: "ma", definition: "\"but\""),
                 Word(title: "meno", definition: "less motion; slower tempo"),
                 Word(title: "meno mosso", definition: "less rapid"),
                 Word(title: "molto", definition: "\"much\"; \"very\""),
                 Word(title: "non troppo", definition: "not too much; without excess"),
                 Word(title: "piú", definition: "\"more\""),
                 Word(title: "piú mosso", definition: "more quickly"),
                 Word(title: "poco, poco a poco", definition: "little, little by little"),
                 Word(title: "presto", definition: "to play quickly, faster than allegro"),
                 Word(title: "ritenuto", altText: "rit. / riten.", definition: "held back in tempo"),
                 Word(title: "senza", definition: "\"without\""),
                 Word(title: "vivace, vivo", definition: "to play quickly, lively")
            ]),
        Grade(number: 3, percentageCorrect: 0),
        Grade(number: 4, percentageCorrect: 0),
        Grade(number: 5, percentageCorrect: 0)]
    
    var body: some Scene {
        WindowGroup {
            ContentView(grades: $grades)
        }
    }
}
