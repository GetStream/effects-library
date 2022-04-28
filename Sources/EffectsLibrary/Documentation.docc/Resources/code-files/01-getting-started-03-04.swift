//
//  ContentView.swift
//  EffectsExample
//
//  Created by Stefan Blos on 28.03.22.
//

import SwiftUI
import EffectsLibrary

struct ContentView: View {
    
    var body: some View {
        ZStack {
            VStack(spacing: 60) {
                Text("Congratulations")
                    .font(.largeTitle)
                
                Text("🎈🎈🎈")
                    .font(.largeTitle)
                
                Text("You did an amazing job and deserve a 🍪 or a nice green 🍏!")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                    .padding(.vertical)
            }
            
            ConfettiView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
