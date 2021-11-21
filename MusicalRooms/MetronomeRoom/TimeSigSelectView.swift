//
//  TimeSigSelectView.swift
//  MusicalRooms
//
//  Created by sap on 15/11/21.
//

import SwiftUI

struct TimeSigSelectView: View {

    @Environment(\.presentationMode) var presentationMode
    
    var lightBrown: Color = Color(red: 131/255, green: 78/255, blue: 44/255, opacity: 1.0)
    var darkBrown: Color = Color(red: 70/255, green: 27/255, blue: 0, opacity: 1.0)
    var backBrown: Color = Color(red: 211/255, green: 165/255, blue: 109/255)

    var signatures:[String] = ["1/4", "2/4", "3/4", "4/4", "5/4", "6/4", "3/8", "5/8", "6/8", "7/8", "9/8", "12/8"]
    @Binding var selIndex: Int
    
    var body: some View {
        
        ForEach(1 ..< 5){ row in
            HStack (spacing: 25){
                ForEach(1 ..< 4) { column in
                    let index: Int = (column + (row-1)*3) - 1
                    let sig = signatures[index]

                    Button {
                        selIndex = index
                    } label: {
                        ZStack{
                            Rectangle()
                                .foregroundColor(selIndex == index ? lightBrown : backBrown)
                                .frame(width: 75, height: 50, alignment: .center)
                                .cornerRadius(10)
                                .padding(4)
                            Text(sig)
                                .font(Font.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        .frame(width: 65, height: 50, alignment: .center)
                    }

                }
            }
        }
        
        Spacer().frame(height:50)
        
        //Dismiss
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            ZStack{
                Rectangle()
                    .fill(lightBrown)
                    .frame(width: 270, height: 60, alignment: .center)
                    .cornerRadius(10)
                Text("OK")
                    .font(Font.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
            }
        }
    }
    
    
}

struct TimeSigSelectView_Previews: PreviewProvider {
    static var previews: some View {
        TimeSigSelectView(signatures: ["1/4", "2/4", "3/4", "4/4", "5/4", "6/4", "3/8", "5/8", "6/8", "7/8", "9/8", "12/8"], selIndex: .constant(0))
    }
}
