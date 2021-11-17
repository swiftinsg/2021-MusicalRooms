import SwiftUI

struct SharpTextViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, design: .rounded))
            .foregroundColor(Color("darkBrown"))
    }
}

struct TunerHomeView: View {
    
    @State var CtoB = ["C", "D", "E", "F", "G", "A", "B"]
    @State var sharps = ["C#", "D#", "F#", "G#", "A#"]
    
    @State var isSoundPlayed = false
    var body: some View {
        VStack {
            HStack {
                ForEach(0 ..< sharps.count) { note in
                    Button {
                        
                    } label: {
                        VStack {
                            Text(sharps[note])
                                .brownBoldText()
                            Text(getEnharmonic(sharps[note]))
                                .brownBoldText()
                        }
                    }
                    .padding()
                    .frame(width:60, height: 100, alignment: .leading)
                    .background( Color("evenLighterBrown"))
                    .cornerRadius(20)
                }
            }
        }
    }
}

struct TunerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TunerHomeView()
    }
}
