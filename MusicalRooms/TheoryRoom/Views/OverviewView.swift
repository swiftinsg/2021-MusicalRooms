//
//  OverviewView.swift
//  MusicalRooms
//
//  Created by Chelsea Ling on 18/11/21.
//

import SwiftUI

struct OverviewView: View {
    
    @Binding var grades: [Grade]
    var grade: Int
    var words: [Word] {
        return getWords(grade)
    }
    
    @State var expandAll = false
    
    var body: some View {
        VStack {
            List {
                if expandAll {
                    ForEach(0 ..< words.count) { word in
                        NavigationLink {
                            FlashcardsView(words: words, currentWord: word)
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
                                        .multilineTextAlignment(.leading)
                                }
                            }
                            .frame(width: 250, height: 42, alignment: .leading)
                        }
                        .listRowBackground(Color("lightBrown"))
                    }
                } else {
                    ForEach(0 ..< 5) { word in
                        NavigationLink {
                            FlashcardsView(words: words, currentWord: word)
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
                                }
                            }
                            .frame(width: 150, height: 42, alignment: .leading)
                        }
                        .listRowBackground(Color("lightBrown"))
                    }
                }
            }
            .frame(width: 420, height: 500, alignment: .center)
            .offset(y: -90)
            
            Button {
                expandAll.toggle()
            } label: {
                HStack {
                    Image(systemName: !expandAll ? "chevron.down" : "chevron.up")
                    Text("Expand All")
                        .fontWeight(.heavy)
                }
                .frame(width: 150, height: 60, alignment: .center)
                .font(.system(size: 19, design: .rounded))
                .foregroundColor(Color(expandAll ? "lightBrown" : "darkBrown"))
                .background(Color(expandAll ? "darkBrown" : "lightBrown"))
                .cornerRadius(20)
            }
            .offset(y: -50)
            
            NavigationLink {
                QuestionView(grades: $grades, grade: grade, words: words)
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
            .navigationTitle("Grade \(grade)")
        }
    }
}


struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView(grades: .constant([Grade(number: 1, percentageCorrect: 0)]), grade: 1)
    }
}
