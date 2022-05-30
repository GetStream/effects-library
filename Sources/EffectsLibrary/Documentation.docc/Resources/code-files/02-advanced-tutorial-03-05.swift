import SwiftUI
import EffectsLibrary

struct ContentView: View {
    
    var config = FireworksConfig(
        content: [
            .emoji("🚀", 10.0),
            .emoji("💥", 3.0)
        ],
        intensity: .medium,
        lifetime: .long,
        initialVelocity: .medium,
        fadeOut: .slow
    )
    
    var body: some View {
        FireworksView(config: config)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
