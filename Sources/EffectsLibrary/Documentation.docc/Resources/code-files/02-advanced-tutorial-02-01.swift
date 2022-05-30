import SwiftUI
import EffectsLibrary

struct ContentView: View {
    var body: some View {
        FireworksView()
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
