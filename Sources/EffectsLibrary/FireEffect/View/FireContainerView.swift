//
//  FireContainerView.swift
//  
//
//  Created by Stefan Blos on 28.04.22.
//

import SwiftUI
import SpriteKit

struct FireContainerView: View {
    
    var proxy: GeometryProxy
    var config: FireConfig
    
    var body: some View {
        SpriteView(
            scene: createScene(of: proxy.size),
            options: [.allowsTransparency]
        )
    }
    
    private func createScene(of size: CGSize) -> SKScene {
        return FireScene(size: size, config: config)
    }
}
