//
//  OverviewView.swift
//  MusicalRooms
//
//  Created by Chelsea Ling on 18/11/21.
//

import SwiftUI

struct OverviewView: View {
    
    @Binding var words: [Word]
    @State var expandAll = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    if expandAll {
                        ForEach(words) { word in
                            NavigationLink {
                                
                            } label: {
                                VStack {
                                    Text(word.title)
                                        .foregroundColor(Color("darkerBrown"))
                                        .font(.system(size: 25, design: .rounded))
                                        .fontWeight(.semibold)
                                    
                                    if let altText = word.altText {
                                        Text(altText)
                                            .foregroundColor(Color("darkerBrown"))
                                            .font(.system(size: 20, design: .rounded))
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.leading)
                                    } else {
                                        Text("---")
                                            .foregroundColor(Color("darkerBrown"))
                                            .font(.system(size: 20, design: .rounded))
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                                .frame(width: 150, height: 42, alignment: .leading)
                            }
                            .listRowBackground(Color("lightBrown"))
                        }
                    } else {
                        ForEach(0 ..< 5) {
                            word in NavigationLink {
                                
                            } label: {
                                VStack {
                                    Text(words[word].title)
                                        .foregroundColor(Color("darkerBrown"))
                                        .font(.system(size: 25, design: .rounded))
                                        .fontWeight(.semibold)
                                    
                                    if let altText = words[word].altText {
                                        Text(altText)
                                            .foregroundColor(Color("darkerBrown"))
                                            .font(.system(size: 20, design: .rounded))
                                            .fontWeight(.medium)
                                    } else {
                                        Text("---")
                                            .foregroundColor(Color("darkerBrown"))
                                            .font(.system(size: 20, design: .rounded))
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                                .frame(width: 150, height: 42, alignment: .leading)
                            }
                            .listRowBackground(Color("lightBrown"))
                        }
                    }
                }
                .frame(width: 400, height: 500, alignment: .center
                )
                .offset(y: -160)
                
                Button {
                    expandAll.toggle()
                } label: {
                    HStack {
                        Image(systemName: !expandAll ? "chevron.down" : "chevron.up")
                        Text("Expand All")
                            .fontWeight(.heavy)
                    }
                    .frame(width: 150, height: 80, alignment: .center)
                    .font(.system(size: 19, design: .rounded))
                    .foregroundColor(Color(expandAll ? "lightBrown" : "darkBrown"))
                    .background(Color(expandAll ? "darkBrown" : "lightBrown"))
                    .cornerRadius(20)
                }
                .offset(y: -120)
                
                Button {
                    
                } label: {
                    Text("Start")
                        .foregroundColor(Color.white)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 30, design: .rounded))
                }
                .padding()
                .frame(width:350, height: 50, alignment: .center)
                .background( Color("darkBrown"))
                .cornerRadius(10)
                .navigationTitle("Grade 1") //to do: link this to TheoryHomeView
                
            }
            
        }
        
    }
}
struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView(words: .constant(
            [
                Word(title:"a tempo"),
                Word(title:"accelerando", altText: "accel."),
                Word(title:"adagio"),
                Word(title:"allegretto"),
                Word(title:"allegro"),
                Word(title:"andante"),
                Word(title:"cantabile"),
                Word(title:"crescendo", altText: "cresc."),
                Word(title:"da capo", altText: "D.C."),
                Word(title:"decrescendo", altText: "decresc."),
                Word(title:"diminuendo", altText: "dimin. / dim."),
                Word(title:"dolce"),
                Word(title:"forte", altText: "f"),
                Word(title:"fortissimo", altText: "ff"),
                Word(title:"fine, al fine"),
                Word(title:"legato"),
                Word(title:"mezzo forte", altText: "mf"),
                Word(title:"moderato"),
                Word(title:"mezzo piano", altText: "mf"),
                Word(title:"piano", altText: "p"),
                Word(title:"pianissimo", altText: "pp"),
                Word(title:"rallentando", altText: "rall."),
                Word(title:"ritardando", altText: "ritard. / rit."),
                Word(title:"staccato", altText: "stacc.")]))
    }
}
