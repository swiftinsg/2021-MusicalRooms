//
//  ReadingHomeView.swift
//  MusicalRooms
//
//  Created by sap on 15/11/21.
//

import SwiftUI

struct ReadingHomeView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text("Alto")
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .font(.system(.title, design: .rounded))
                    .lineLimit(3)
                    .foregroundColor(Color("darkBrown"))
                
                Spacer()
            }
            
            Spacer()
            
        }
        .padding()
        .frame(width:380, height: 170, alignment: .leading)
        .background( Color("lightBrown"))
        .cornerRadius(20)
    }
}

struct ReadingHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingHomeView()
    }
}
