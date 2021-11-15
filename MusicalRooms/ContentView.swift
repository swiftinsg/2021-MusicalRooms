import SwiftUI

struct ContentView: View {
    
    var lightBrown:Color = Color(red: 131/255, green: 78/255, blue: 44/255, opacity: 1.0)
    var darkBrown:Color = Color(red: 70/255, green: 27/255, blue: 0, opacity: 1.0)
    
    var body: some View {
        TabView {
            TheoryHomeView()
                .tabItem{
                    Image(systemName: "rectangle.and.pencil.and.ellipsis")
                    Text("Theory")
                }
            
            ReadingHomeView()
                .tabItem{
                    Image(systemName: "music.note.list")
                    Text("Sightreading")
                }
            
            TunerHomeView()
                .tabItem{
                    Image(systemName: "tuningfork")
                    Text("Tuner")
                }
    
            MetronomeHomeView()
                .tabItem{
                    Image(systemName: "metronome")
                    Text("Metronome")
                }
        }
        .accentColor(darkBrown)
        .font(Font.body)
        .onAppear{
            UITabBar.appearance().unselectedItemTintColor = UIColor.init(lightBrown)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
