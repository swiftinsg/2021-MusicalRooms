import SwiftUI

struct BpmNumpadView: View {
    
    @Environment(\.presentationMode) var presentationMode
        
    @Binding var bpm: Int
    @State var newBpm: Int
    @State var hasChanged: Bool = false
    
    @Binding var updateBPM: Bool
    
    init(bpm: Binding<Int>, updateBPM: Binding<Bool>){
        self._bpm = bpm
        self._newBpm = State(initialValue: bpm.wrappedValue)
        self._hasChanged = State(initialValue: false)
        self._updateBPM = updateBPM
    }
    
    var body: some View {
        
        Text("\(newBpm)")
            .font(.system(size: 32, design: .rounded).bold())
            .foregroundColor(Color("lightBrown"))
            .padding(.vertical, 5)
            .padding(.horizontal, 30)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("lightBrown"), lineWidth: 4)
            )
        
        Spacer().frame(height: 30)
        
        ForEach(1 ..< 4){ row in
            HStack {
                ForEach(1 ..< 4){ column in
                    let num = column + (row-1) * 3
                    Button {
                        appendDigit(digit: num)
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundColor(Color("darkBrown"))
                                .frame(width: 60, height: 60, alignment: .center)
                            Text("\(num)")
                                .font(Font.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        
                    }
                    
                }
            }
        }
        Button {
            appendDigit(digit: 0)
        } label: {
            ZStack{
                Circle()
                    .foregroundColor(Color("darkBrown"))
                    .frame(width: 60, height: 60, alignment: .center)
                Text("0")
                    .font(Font.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
            }
            
        }
        .padding(10)
        
        Spacer()
            .frame(height:30)
        
        //Submit button
        Button {
            bpm = newBpm
            updateBPM = true
            presentationMode.wrappedValue.dismiss()
        } label: {
            ZStack{
                Rectangle()
                    .fill(Color("lightBrown"))
                    .frame(width: 270, height: 60, alignment: .center)
                    .cornerRadius(10)
                Text("OK")
                    .font(Font.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
            }
        }
    }
    
    func appendDigit(digit: Int) {
        if hasChanged {
            if newBpm < 100{
                let joinStr = "\(newBpm)\(digit)"
                newBpm = Int(joinStr) ?? 0
            } else { return }
        } else {
            newBpm = digit
            self.hasChanged = true
        }
    }
    
}




struct BpmNumpadView_Previews: PreviewProvider {
    static var previews: some View {
        BpmNumpadView(bpm: .constant(60), updateBPM: .constant(false))
    }
}
