//
//  FireScene.swift
//  
//
//  Created by Stefan Blos on 28.04.22.
//

import SpriteKit

class FireScene: SKScene {
    
    var config: FireConfig
    
    init(size: CGSize, config: FireConfig) {
        self.config = config
        super.init(size: size)
        
        backgroundColor = UIColor(config.backgroundColor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        launchFire()
    }
    
    func launchFire() {
        for contentElement in config.content {
            let node = SKEmitterNode()
            
            node.particleTexture = SKTexture(image: contentElement.image)
            
            // Particle General
            node.particleBirthRate = CGFloat(config.birthRateValue)
            node.particleLifetime = CGFloat(config.lifetimeValue)
            node.particlePositionRange = CGVector(dx: size.width / 4, dy: 5)
            
            node.emissionAngle = .pi / 2
            node.emissionAngleRange = config.spreadRadiusValue
            
            node.particleAlpha = 0.8
            node.particleAlphaRange = 0.2
            node.particleAlphaSpeed = CGFloat(config.alphaSpeedValue)
            
            node.yAcceleration = 0
            node.particleScale = contentElement.scale
            node.particleScaleRange = 0.4
            node.particleScaleSpeed = -0.5
            
            node.particleSpeed = config.velocityValue
            node.particleSpeedRange = 50
            node.particleColor = contentElement.color ?? .blue
            node.particleColorBlendFactor = 1
            
            node.particleRotation = 0
            node.particleRotationRange = 0
            node.particleRotationSpeed = 0
            
            node.particleBlendMode = .add
            node.fieldBitMask = 0
            
            node.position = CGPoint(x: size.width / 2, y: size.height / 2)
            addChild(node)
        }
    }

}
