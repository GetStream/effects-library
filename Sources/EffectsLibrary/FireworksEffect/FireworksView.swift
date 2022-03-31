//
//  SwiftUIView.swift
//  
//
//  Created by Stefan Blos on 31.03.22.
//

import SwiftUI
import SpriteKit

struct FireworksView: View {
    
    var config = FireworksConfig(intensity: .high)
    
    var body: some View {
        GeometryReader { proxy in
            FireworksContainerView(proxy: proxy, config: config)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FireworksView()
            
            FireworksView(
                config: FireworksConfig(
                    content: [ .emoji("😎", 15)],
                    intensity: .low,
                    lifetime: .long,
                    speed: .fast,
                    fadeOut: .slow,
                    spreadRadius: .low
                )
            )
        }
        
    }
}
