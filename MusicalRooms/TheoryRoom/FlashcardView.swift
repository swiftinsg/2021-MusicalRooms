//
//  FlashcardsView.swift
//  MusicalRooms
//
//  Created by Chelsea Ling on 19/11/21.
//

import SwiftUI

struct FlashcardsView: View {

    var words: [Word]
    var currentWord: Int
    
    @State var duplicateCurrentWord = 0
    @State var isFlipped = false
    @State var degrees: Angle = Angle(degrees: 0)
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 350, height: 300, alignment: .center)
                    .foregroundColor(Color("lightBrown"))
                    .rotation3DEffect(degrees, axis: (x: 0, y: 1, z: 0))
                    .onTapGesture {
                        withAnimation {
                            degrees += Angle(degrees: 180)
                        }
                    }
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 350, height: 50, alignment: .leading)
                    .foregroundColor(Color("darkBrown"))
                    .overlay(
                        Text("\(duplicateCurrentWord) / \(words.count)")
                            .font(.system(size: 19, design: .rounded))
                            .foregroundColor(Color("darkerBrown"))
                            .bold()
                            .offset(x: -120)
                    )
                    .offset(y: -125)
                
                VStack {
                    Text(words[duplicateCurrentWord].title)
                        .bold()
                        .font(.system(size: 30, design: .rounded))
                    if let altText = words[currentWord].altText {
                        Text(altText)
                            .font(.system(size: 20, design: .rounded))
                    } else {
                        Text("---")
                            .font(.system(size: 20, design: .rounded))
                    }
                }
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 350, height: 90)
                .foregroundColor(Color("lightBrown"))
                .overlay(
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: isFlipped ? "checkmark" : "multiply")
                                .foregroundColor(Color("darkerBrown"))
                                .font(.system(size: 30))
                        }
                )
                .offset(y: 30)
        }
        .onAppear {
            duplicateCurrentWord = currentWord
        }
    }
}

struct FlashcardsView_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardsView(words: [Word(title: "AAA", definition: "AAA")], currentWord: 0)
    }
}
