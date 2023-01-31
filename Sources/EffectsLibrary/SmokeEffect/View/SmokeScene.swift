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
        
        #if os(iOS) || os(watchOS)
        backgroundColor = UIColor(config.backgroundColor)
        #elseif os(OSX)
        backgroundColor = SKColor(config.backgroundColor)
        #endif
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
            node.emissionAngleRange = config.spreadRadiusValue
            
            node.particleAlpha = 0.4
            node.particleAlphaRange = 0.3
            node.particleAlphaSpeed = CGFloat(config.alphaSpeedValue)
            
            node.yAcceleration = 0
            node.particleScale = contentElement.scale
            node.particleScaleRange = 0.3
            node.particleScaleSpeed = 0.5
            
            node.particleSpeed = config.velocityValue
            node.particleSpeedRange = 40
            #if os(iOS) || os(watchOS)
            node.particleColor = UIColor(contentElement.color ?? .black)
            #elseif os(OSX)
            node.particleColor = NSColor(contentElement.color ?? .black)
            #endif
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

