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
        Spacer()
        VStack(spacing:0){
            Spacer()

            RoundedRectangle(cornerRadius: 10)
                    .frame(height: 50, alignment: .leading)
                    .foregroundColor(Color("darkBrown"))
                    .overlay(
                            VStack(alignment:.leading){
                                Text("\(duplicateCurrentWord + 1) / \(words.count)")
                                        .font(.system(size: 25, design: .rounded))
                                        .foregroundColor(Color("evenLighterBrown"))
                                        .bold()
                            }
                    )

            VStack {
                if isFlipped {
                    Text(words[duplicateCurrentWord].definition)
                            .font(.system(size: 23, design: .rounded))
                            .padding()
                            .rotation3DEffect(.degrees(180), axis: (x:0, y:1, z:0))
                } else {
                    Text(words[duplicateCurrentWord].title)
                            .bold()
                            .font(.system(size: 25, design: .rounded))
                    if let altText = words[duplicateCurrentWord].altText {
                        Text(altText)
                                .font(.system(size: 18, design: .rounded))
                    } else {
                        Text("  ")
                                .font(.system(size: 18, design: .rounded))
                    }
                }
            }
            .padding(.top)
            .padding(.vertical, 45)
            .rotation3DEffect(degrees, axis: (x: 0, y: 1, z: 0))
            .frame(maxWidth: .infinity)
            .background(
                    Color("lightBrown")
                            .rotation3DEffect(degrees, axis: (x: 0, y: 1, z: 0))
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.3)){
                                    degrees += Angle(degrees: 180)
                                    isFlipped.toggle()
                                }
                            }
            )
            .cornerRadius(15)

            Spacer().frame(height:25)

            Rectangle()
            .frame(height: 60)
            .cornerRadius(15)
            .foregroundColor(Color("lightBrown"))
            .overlay(
                    HStack{
                        Spacer()
                        //LEFT BT
                        Button {
                            withAnimation(.easeInOut(duration: 0.3)){
                                if duplicateCurrentWord != 0 {
                                    duplicateCurrentWord -= 1
                                } else if duplicateCurrentWord == 0 {
                                    duplicateCurrentWord = words.count - 1
                                }
                            }
                        } label: {
                            Image(systemName: "chevron.left.2")
                                    .foregroundColor(Color("darkBrown"))
                                    .font(.system(size: 40, weight: .semibold))
                        }.padding()
                        Spacer()

                        Rectangle()
                                .frame(width: 2)
                                .foregroundColor(Color("darkBrown"))

                        Spacer()
                        //RIGHT BT
                        Button {
                            withAnimation(.easeInOut(duration: 0.3)){
                                if isFlipped {
                                    presentationMode.wrappedValue.dismiss()
                                } else {
                                    if duplicateCurrentWord + 1 != words.count {
                                        duplicateCurrentWord += 1
                                    } else if duplicateCurrentWord == words.count - 1 {
                                        duplicateCurrentWord = 0
                                    }
                                }
                            }
                        } label: {
                            Image(systemName: isFlipped ? "checkmark" : "chevron.right.2")
                                    .foregroundColor(Color("darkBrown"))
                                    .font(.system(size: 40, weight: .semibold))
                        }.padding()
                        Spacer()
                    }
            )
            Spacer()

        }
        .padding()
        .onAppear {
            duplicateCurrentWord = currentWord
        }
        Spacer()
    }
}

struct FlashcardsView_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardsView(words: [Word(title: "AAA", definition: "AAA")], currentWord: 0)
    }
}
