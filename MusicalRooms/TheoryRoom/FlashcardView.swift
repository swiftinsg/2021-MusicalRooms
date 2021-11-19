//
//  FlashcardsView.swift
//  MusicalRooms
//
//  Created by Chelsea Ling on 19/11/21.
//

import SwiftUI

struct FlashcardsView: View {

    var body: some View {
        VStack (alignment: .center, spacing: 50) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width:350, height: 250, alignment: .leading)
                .foregroundColor(Color("lightBrown"))
                .overlay(
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("darkLightBrown"))
                            .frame(width: 350, height: 60, alignment: .leading)
                        
                        Text("1/10")
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                            .font(.system(.title, design: .rounded))
                            .lineLimit(3)
                            .foregroundColor(Color("darkBrown"))
                            .frame(width: 350)
                            .offset(x: -120)
                    }
                        .offset(y: -94)
                )
            HStack(alignment: .center){
                    Button {
                        
                    } label: {
                        Text("      ")
                        Image(systemName:"chevron.left.2")
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("darkBrown"))
                            .font(Font.system(size: 50, weight: .bold))
                           
                    }
                    .padding()
                    .frame(width:350, height: 90, alignment: .leading)
                    .background( Color("darkLightBrown"))
                    .cornerRadius(10)
                    
                    .overlay(
                Button {
                    
                } label: {
                    
                    Image(systemName:"chevron.right.2")
                        
                        .foregroundColor(Color("darkBrown"))
                        .font(Font.system(size: 50, weight: .bold))
                    Text("    ")
                }
                .padding()
                .frame(width:150, height: 90)
                .background( Color("darkLightBrown"))
                .cornerRadius(10)
                
                    .offset(x: 100)
                    )
                    .overlay(
                    Image(systemName: "line.diagonal")
                        .foregroundColor(Color("darkBrown"))
                        .font(Font.system(size: 96, weight: .ultraLight))
                        .rotationEffect(.degrees(-45))
                    )
            }
    }
    }
}

struct FlashcardsView_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardsView()
    }
}
