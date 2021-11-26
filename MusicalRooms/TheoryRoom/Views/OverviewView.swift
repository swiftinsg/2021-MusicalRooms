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
        getWords(grade)
    }
    
    var body: some View {
        NavigationView{
        VStack {
            Text("Musical terms")
                .font(Font.system(size: 24, weight: .semibold, design: .rounded))
                .padding(.top, 20)
            Text("Click to open a flashcard")
                .font(Font.system(size: 12, weight: .medium, design: .rounded))

            List {
                ForEach(0 ..< (words.count), id:\.self) { word in
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
                                                }
                        .listRowBackground(Color("lightBrown"))
                    }
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .cornerRadius(15)
            .listStyle(.inset)
          
            
            NavigationLink {
                QuestionView(grades: $grades, grade: grade, words: words)
            } label: {
                Text("Start Quiz")
                    .foregroundColor(Color("evenLighterBrown"))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 30, design: .rounded))
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .background(Color("darkBrown"))
            .cornerRadius(10)
            .navigationTitle("Grade \(grade)")

        }
        .offset(y:-40)
        .padding()
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView(grades: .constant([Grade(number: 1, percentageCorrect: 0)]), grade: 1)
    }
}
