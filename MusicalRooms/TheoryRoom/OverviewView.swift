//
//  OverviewView.swift
//  MusicalRooms
//
//  Created by Chelsea Ling on 18/11/21.
//

import SwiftUI

struct OverviewView: View {
    
    @State var words = [Word(title:"a tempo"),
                        Word(title:"accelerando (or accel.)"),
                        Word(title:"adagio"),
                        Word(title:"allegretto"),
                        Word(title:"allegro"),
                        Word(title:"andante"),
                        Word(title:"cantabile"),
                        Word(title:"crescendo (or cresc.)"),
                        Word(title:"da capo (or D.C.)"),
                        Word(title:"decrescendo (or decresc.)"),
                        Word(title:"diminuendo (or dim.)"),
                        Word(title:"dolce"),
                        Word(title:"f (forte)"),
                        Word(title:"ff (fortissimo)"),
                        Word(title:"fine, al fine"),
                        Word(title:"legato"),
                        Word(title:"mf (mezzo forte)"),
                        Word(title:"moderato"),
                        Word(title:"mp (mezzo piano)"),
                        Word(title:"p (piano)"),
                        Word(title:"pp (pianissimo)"),
                        Word(title:"rallentando (or rall.)"),
                        Word(title:"ritardando (or ritard. or rit.)"),
                        Word(title:"staccato (or stacc.)")]
    
    
    var body: some View {
        List {
            ForEach(words) {word in
                Text(word.title)
            }
        }
        .listRowBackground(Color("darkBrown"))
        .navigationTitle("Overview")
    }
}
struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
    }
}
