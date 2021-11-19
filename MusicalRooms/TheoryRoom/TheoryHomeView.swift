//
//  TheoryHomeView.swift
//  MusicalRooms
//
//  Created by sap on 15/11/21.
//

import SwiftUI

struct TheoryHomeView: View {

    @State var grades = [
        Grade(number: 1, percentageCorrect: 80),
        Grade(number: 2, percentageCorrect: 80),
        Grade(number: 3, percentageCorrect: 80),
        Grade(number: 4, percentageCorrect: 80),
        Grade(number: 5, percentageCorrect: 80)]

    @State var percentCorrect: Double = 50

    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Theory")
                .font(Font.system(size: 32, weight: .bold))
                .frame( alignment: .leading)
                .padding()

            ScrollView(.vertical, showsIndicators: false) {
                ForEach(grades) { grade in
                    NavigationLink {

                    } label: {
                        VStack(alignment: .leading) {
                            HStack(alignment: .bottom) {
                                    Text("Grade \(grade.number)")
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 25, design: .rounded))
                                    .lineLimit(3)
                                    .foregroundColor(Color("darkBrown"))

                                Text(String(format: "%.2f", grade.percentageCorrect) + "%")
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 25, design: .rounded))
                                    .lineLimit(3)
                                    .foregroundColor(Color("darkerBrown"))
                                    .offset(x: 100)

                            }
                            .offset(y: -20)

                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color("evenLighterBrown"))
                                .frame(width: 300, height: 10, alignment: .leading)
                                .overlay(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color("darkBrown"))
                                        .frame(width: (grade.percentageCorrect / 100 * 300))
                                }
                        }
                        .padding()
                        .frame(width: 340, height: 135, alignment: .leading)
                        .background(Color("evenLighterBrown"))
                        .cornerRadius(20)
                    }
                }
            }
            .frame(width: 400)
        }
        .offset(y:20)
    }
}

struct TheoryHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TheoryHomeView()
    }
}
