//
//  SmokeScene.swift
//  
//
//  Created by Stefan Blos on 05.04.22.
//

import SpriteKit

class SmokeScene: SKScene {
    
    var config: SmokeConfig
    
    init(size: CGSize, config: SmokeConfig) {
        self.config = config
        super.init(size: size)
        
        backgroundColor = UIColor(config.backgroundColor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func didMove(to view: SKView) {
        launchSmoke()
    }
    
    var customBirthRate: CGFloat {
        switch config.intensity {
        case .low:
            return 10
        case .medium:
            return 40
        case .high:
            return 100
        }
    }
    
    func launchSmoke() {
        for contentElement in config.content {
            let node = SKEmitterNode()
            
            node.particleTexture = SKTexture(image: contentElement.image)
            
            // Particle General
            node.particleBirthRate = customBirthRate
            node.particleLifetime = CGFloat(config.lifetimeValue)
            node.particlePositionRange = CGVector(dx: size.width / 4, dy: 30)
            
            node.emissionAngle = 0
            node.emissionAngleRange = .pi * 2
            
            node.particleAlpha = 0.4
            node.particleAlphaRange = 0.3
            node.particleAlphaSpeed = -0.15
            
            node.yAcceleration = 10
            
            node.particleScale = 0.5 * contentElement.scale
            node.particleScaleRange = 0.3
            node.particleScaleSpeed = 0.5
            
            node.particleSpeed = 40
            node.particleSpeedRange = 40
            node.particleColor = .black
            node.particleColorBlendFactor = 1
            
            node.particleRotation = 0
            node.particleRotationRange = .pi * 2
            node.particleRotationSpeed = .pi * 1.6
            
            node.particleBlendMode = .alpha
            node.fieldBitMask = 0
            
            node.position = CGPoint(x: size.width / 2, y: size.height / 2)
            addChild(node)
        }
    }
}

