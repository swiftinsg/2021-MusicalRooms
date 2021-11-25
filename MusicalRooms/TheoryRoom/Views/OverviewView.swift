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
    
    @State var expandAll = false
    
    var body: some View {
        VStack {
            Spacer().frame(height:30)

            Text("Musical terms")
                .font(Font.system(size: 26, weight: .bold, design: .rounded))
                .padding(.top, 20)
            Text("Click to open flashcard")
                .font(Font.system(size: 12, weight: .medium, design: .rounded))

            List {
                ForEach(0 ..< (expandAll ? words.count : 5), id:\.self) { word in
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
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .listStyle(.inset)
            Spacer().frame(height:30)
            
            Button {
                withAnimation(.easeInOut(duration: 0.5)){
                    expandAll.toggle()
                }
            } label: {
                HStack {
                    Image(systemName: !expandAll ? "chevron.down" : "chevron.up")
                    Text(expandAll ? "Collapse All" : "Expand All")
                        .fontWeight(.heavy)
                }
                .frame(width: 150, height: 60, alignment: .center)
                .font(.system(size: 19, design: .rounded))
                .foregroundColor(Color(expandAll ? "lightBrown" : "darkerBrown"))
                .background(Color(expandAll ? "darkerBrown" : "lightBrown"))
                .cornerRadius(15)
            }

            Spacer().frame(height:30)
            
            NavigationLink {
                QuestionView(grades: $grades, grade: grade, words: words)
            } label: {
                Text("Start Quiz")
                    .foregroundColor(Color.white)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 30, design: .rounded))
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .frame(width: 300, height: 60, alignment: .center)
            .background( Color("darkBrown"))
            .cornerRadius(10)
            .navigationTitle("Grade \(grade)")

        }.offset(y:-40)
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView(grades: .constant([Grade(number: 1, percentageCorrect: 0)]), grade: 1)
    }
}
