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
        SpriteView(scene: createScene(of: proxy.size))
    }
    
    func createScene(of size: CGSize) -> SKScene {
        let scene = GameScene(size: size, config: config)
        return scene
    }
}
