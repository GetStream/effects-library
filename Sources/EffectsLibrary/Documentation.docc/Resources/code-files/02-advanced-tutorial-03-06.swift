import SwiftUI
import EffectsLibrary

struct ContentView: View {
    
    var config = FireworksConfig(
        content: [
            .image(UIImage(named: "stream-logo")!, nil, 0.8)
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
