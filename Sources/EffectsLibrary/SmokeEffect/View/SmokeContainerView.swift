//
//  SmokeContainerView.swift
//  
//
//  Created by Stefan Blos on 05.04.22.
//

import SwiftUI
import SpriteKit

struct SmokeContainerView: View {
    
    var proxy: GeometryProxy
    var config: SmokeConfig
    
    var body: some View {
        SpriteView(
            scene: createScene(of: proxy.size),
            options: [.allowsTransparency]
        )
    }
    
    func createScene(of size: CGSize) -> SKScene {
        return SmokeScene(size: size, config: config)
        
    }
}
