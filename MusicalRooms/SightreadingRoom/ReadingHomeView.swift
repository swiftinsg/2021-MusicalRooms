//
//  ReadingHomeView.swift
//  MusicalRooms
//
//  Created by sap on 15/11/21.
//

import SwiftUI

struct ReadingHomeView: View {
    
    @State var clefs = ["Treble", "Alto", "Tenor", "Bass"]
    @State var timedQuestions = [15,30,45,60]
    @State var drilledQuestions = [10,20,30,40]
    
    var body: some View {
        
        //Header
        VStack(alignment: .leading) {
            Text("Sightreading")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
                .padding(.horizontal)
                .padding(.top)
                .font(.system(size: 1000))
            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(0 ..< clefs.count) { clef in
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading) {
                            Text(clefs[clef])
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.leading)
                                .font(.system(.title, design: .rounded))
                                .lineLimit(3)
                                .foregroundColor(Color("darkBrown"))
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Timed:")
                                        .frame(width: 60, height: 20)
                                    HStack {
                                        ForEach(0 ..< timedQuestions.count) { time in
                                            Text("\(timedQuestions[time])s")
                                                .frame(width: 45, height: 20, alignment: .center)
                                                .onTapGesture {
                                                    
                                                }
                                        }
                                    }
                                }
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 20,design: .rounded))
                                .lineLimit(3)
                                .foregroundColor(Color("darkerBrown"))
                                
                                HStack {
                                    Text("Drill:")
                                        .frame(width: 60, height: 20, alignment: .leading)
                                    HStack {
                                        ForEach(0 ..< drilledQuestions.count) { drill in
                                            Text("\(drilledQuestions[drill])")
                                                .frame(width: 45, height: 20, alignment: .center)
                                                .onTapGesture {
                                                    
                                                }
                                        }
                                    }
                                }
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 20,design: .rounded))
                                .lineLimit(3)
                                .foregroundColor(Color("darkerBrown"))
                            }
                            .padding()
                            .frame(width: 300, height: 80, alignment: .leading)
                            .background( Color("evenLighterBrown"))
                            .cornerRadius(20)
                            
                        }
                    }
                    .padding()
                    .frame(width: 340, height: 160, alignment: .leading)
                    .background(Color("lightBrown"))
                    .cornerRadius(20)
                }
            }
        }
    }
}

struct ReadingHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingHomeView()
    }
}
