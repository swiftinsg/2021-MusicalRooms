import SwiftUI

struct BpmNumpadView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var lightBrown: Color = Color(red: 131/255, green: 78/255, blue: 44/255, opacity: 1.0)
    var darkBrown: Color = Color(red: 70/255, green: 27/255, blue: 0, opacity: 1.0)
    var backBrown: Color = Color(red: 211/255, green: 165/255, blue: 109/255)
    
    @Binding var bpm: Int
    @State var newBpm: Int
    @State var hasChanged: Bool = false
    
    init(bpm: Binding<Int>){
        self._bpm = bpm
        self._newBpm = State(initialValue: bpm.wrappedValue)
        self.hasChanged = false
    }
    
    var body: some View {
        
        Text("\(bpm)")
            .font(.system(size: 32, design: .rounded).bold())
            .foregroundColor(lightBrown)
            .padding(.top, 5)
            .padding(.bottom, 5)
            .padding(.leading, 30)
            .padding(.trailing, 30)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lightBrown, lineWidth: 4)
            )
        
        Spacer().frame(height:20)
        
        ForEach(1 ..< 4){ row in
            HStack {
                ForEach(1 ..< 4){ column in
                    let num = column + (row-1) * 3
                    Button {
                        appendDigit(digit: num)
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundColor(backBrown)
                                .frame(width: 60, height: 60, alignment: .center)
                            Text("\(num)")
                                .font(Font.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        
                    }
                    .padding(10)
                }
            }
        }
        Button {
            appendDigit(digit: 0)
        } label: {
            ZStack{
                Circle()
                    .foregroundColor(backBrown)
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
    
    func appendDigit(digit: Int) {
        if hasChanged {
            if(bpm < 100){
                let joinStr = "\(bpm)\(digit)"
                bpm = Int(joinStr) ?? 0
            } else {return}
        } else {
            bpm = digit
            self.hasChanged = true
        }
    }
    
}




struct BpmNumpadView_Previews: PreviewProvider {
    static var previews: some View {
        BpmNumpadView(bpm: .constant(60))
    }
}
