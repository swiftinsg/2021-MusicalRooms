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
            //Alto
            HStack(alignment: .bottom) {
                
                VStack(alignment: .leading) {
                    
                    Text("Alto")
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .font(.system(.title, design: .rounded))
                        .lineLimit(3)
                        .foregroundColor(Color("darkerBrown"))
                    
                    
                    VStack(alignment: .leading) {
                        Text("Timed:     15s      30s      45s      60s")
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 20,design: .rounded))
                            .lineLimit(3)
                            .foregroundColor(Color("darkerBrown"))
                        Text("Drill:          10        20         30        40")
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 20,design: .rounded))
                            .lineLimit(3)
                            .foregroundColor(Color("darkerBrown"))
                    }
                    .padding()
                    .frame(width:350, height: 80, alignment: .leading)
                    .background( Color("evenLighterBrown"))
                    .cornerRadius(20)
                    
                }
                
                Spacer()
                
            }
            
            .padding()
            .frame(width:380, height: 170, alignment: .leading)
            .background( Color("lightBrown"))
            .cornerRadius(20)
            
            // Bass
            HStack(alignment: .bottom) {
                
                VStack(alignment: .leading) {
                    
                    Text("Bass")
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .font(.system(.title, design: .rounded))
                        .lineLimit(3)
                        .foregroundColor(Color("darkerBrown"))
                    
                    
                    VStack(alignment: .leading) {
                        Text("Timed:     15s      30s      45s      60s")
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 20,design: .rounded))
                            .lineLimit(3)
                            .foregroundColor(Color("darkerBrown"))
                        Text("Drill:          10        20         30        40")
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 20,design: .rounded))
                            .lineLimit(3)
                            .foregroundColor(Color("darkerBrown"))
                    }
                    .padding()
                    .frame(width:350, height: 80, alignment: .leading)
                    .background( Color("evenLighterBrown"))
                    .cornerRadius(20)
                    
                    
                    Spacer()
    
                }
                .padding()
                .frame(width:380, height: 170, alignment: .leading)
                .background( Color("lightBrown"))
                .cornerRadius(20)
                
            }
            // Tenor
            HStack(alignment: .bottom) {
                
                VStack(alignment: .leading) {
                    
                    Text("Tenor")
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .font(.system(.title, design: .rounded))
                        .lineLimit(3)
                        .foregroundColor(Color("darkerBrown"))
                    
                    
                    VStack(alignment: .leading) {
                        Text("Timed:     15s      30s      45s      60s")
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 20,design: .rounded))
                            .lineLimit(3)
                            .foregroundColor(Color("darkerBrown"))
                        Text("Drill:          10        20         30        40")
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 20,design: .rounded))
                            .lineLimit(3)
                            .foregroundColor(Color("darkerBrown"))
                    }
                    .padding()
                    .frame(width:350, height: 80, alignment: .leading)
                    .background( Color("evenLighterBrown"))
                    .cornerRadius(20)
                    
                    
                    Spacer()
    
                }
                .padding()
                .frame(width:380, height: 170, alignment: .leading)
                .background( Color("lightBrown"))
                .cornerRadius(20)
                
            }
            // Treble
            HStack(alignment: .bottom) {
                
                VStack(alignment: .leading) {
                    
                    Text("Treble")
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .font(.system(.title, design: .rounded))
                        .lineLimit(3)
                        .foregroundColor(Color("darkerBrown"))
                    
                    
                    VStack(alignment: .leading) {
                        Text("Timed:     15s      30s      45s      60s")
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 20,design: .rounded))
                            .lineLimit(3)
                            .foregroundColor(Color("darkerBrown"))
                        Text("Drill:          10        20         30        40")
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 20,design: .rounded))
                            .lineLimit(3)
                            .foregroundColor(Color("darkerBrown"))
                    }
                    .padding()
                    .frame(width:380, height: 170, alignment: .leading)
                    .background( Color("lightBrown"))
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
