//
//  ActualResultsView.swift
//  MusicalRooms
//
//  Created by Chelsea Ling on 24/11/21.
//

import SwiftUI

struct ActualResultsView: View {
    
    @Binding var grades: [Grade]
    
    var percentCorrect: Double
    var grade: Int
    var words: [Word] {
        return getWords(grade)
    }
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Text("Results")
                .font(Font.system(size: 28, weight: .bold))
                .padding()
                .multilineTextAlignment(.leading)
                .offset(y:-80)
            
            VStack {
                Text(String(format: "%.2f", percentCorrect) + "%")
                    .multilineTextAlignment(.leading)
                    .font(Font.system(size: 40, weight: .semibold, design: .rounded))
                    .lineLimit(3)
                    .foregroundColor(Color("darkerBrown"))
                
                    .overlay(
                        ResultsView(progress: CGFloat(percentCorrect)/100)
                            .frame(width: 200, height: 200)
                    )
                    .offset(y:-100)
                List {
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
                            .frame(width: 150, height: 42, alignment: .leading)
                        }
                        .listRowBackground(Color("lightBrown"))
                    }
                }
            }
            .frame(width: 420, height: 350, alignment: .center)
            .offset(y: 120)
            
            Button {
                grades[grade-1].percentageCorrect = percentCorrect
                presentationMode.wrappedValue.dismiss()
            } label: {
                    Rectangle()
                        .frame(width: 250, height: 80)
                        .foregroundColor(Color("darkBrown"))
                        .cornerRadius(10)
                        .overlay(
                            Text("Save your Score")
                                .font(Font.system(size: 20, design: .rounded))
                                .foregroundColor(Color("lightBrown"))
                                .fontWeight(.heavy)
                        )
                }
            .offset(y: 150)
        }
        .offset(y: -80)
    }
}

struct ActualResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ActualResultsView(grades: .constant([
            Grade(number: 1, percentageCorrect: 0),
            Grade(number: 4, percentageCorrect: 0),
            Grade(number: 5, percentageCorrect: 0)]), percentCorrect: 10, grade:1)
    }
}
