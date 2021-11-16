//
//  TimeSigSelectView.swift
//  MusicalRooms
//
//  Created by sap on 15/11/21.
//

import SwiftUI

struct TimeSigSelectView: View {
    
    var signatures = ["1/4", "2/4", "3/4", "4/4", "5/4", "6/4", "3/8", "5/8", "6/8", "7/8", "9/8", "12/8"]
    @Binding var selIndex: Int
    
    var body: some View {
        
        ScrollView {
            ForEach(1 ..< 4){ row in
                HStack {
                    ForEach(1 ..< 5) { column in
                        var index = (row - 1) * 4 + column
                        
                        Button {
                            //Select
                        } label: {
                            ZStack{
                                Circle()
                                Text(signatures[index])
                            }
                        }
                    }
                }
            }
        }
    }
    
    func getSig(index: Int) -> String {
        return signatures[index]
    }
}

struct TimeSigSelectView_Previews: PreviewProvider {
    static var previews: some View {
        TimeSigSelectView(signatures: ["1/4", "2/4", "3/4", "4/4", "5/4", "6/4", "3/8", "5/8", "6/8", "7/8", "9/8", "12/8"], selIndex: .constant(0))
    }
}
