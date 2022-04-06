//
//  FireworksContainerView.swift
//  
//
//  Created by Stefan Blos on 31.03.22.
//

import SwiftUI
import SpriteKit

struct FireworksContainerView: View {
    
    var proxy: GeometryProxy
    var config: FireworksConfig
    
    var body: some View {
        return SpriteView(
            scene: createScene(of: proxy.size),
            options: [.allowsTransparency]
        )
    }
    
    func createScene(of size: CGSize) -> SKScene {
        return FireworksScene(size: size, config: config)
    }
}
