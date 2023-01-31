//
//  FireworksScene.swift
//  
//
//  Created by Stefan Blos on 31.03.22.
//

import SpriteKit

class FireworksScene: SKScene {
    
    var config: FireworksConfig
    
    init(size: CGSize, config: FireworksConfig) {
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
        Timer.scheduledTimer(
            timeInterval: TimeInterval(config.birthRateValue),
            target: self,
            selector: #selector(launchFireworks),
            userInfo: nil,
            repeats: true
        )
    }
    
    var customBirthRate: CGFloat {
        switch config.intensity {
        case .low:
            return 512
        case .medium:
            return 2048
        case .high:
            return 4096
        }
    }
    
    var customParticlesToEmit: Int {
        switch config.intensity {
        case .low:
            return 126
        case .medium:
            return 256
        case .high:
            return 512
        }
    }
    
    func explosion(at point: CGPoint) {
        let node = SKEmitterNode()
        guard let content = config.content.randomElement() else { return }
        
        node.particleTexture = SKTexture(image: content.image)
        
        // Particle General
        node.particleBirthRate = customBirthRate
        node.numParticlesToEmit = customParticlesToEmit
        node.particleLifetime = CGFloat(config.lifetimeValue)
        node.yAcceleration = -500
        
        // Particle Speed
        node.particleSpeed = config.velocityValue
        node.particleSpeedRange = 200
        
        // Particle Angle
        node.emissionAngle = config.spreadRadiusValue
        node.emissionAngleRange = config.spreadRadiusValue
        
        // Particle Alpha
        node.particleAlpha = 0.8
        node.particleAlphaSpeed = CGFloat(config.alphaSpeedValue)
        node.particleAlphaRange = 0.2
        
        // Particle Scale
        node.particleScale = 0.15 * content.scale
        
        // Particle Color
        #if os(iOS) || os(watchOS)
        node.particleColor = UIColor(red: 171 / 255.0, green: 80 / 255.0, blue: 21 / 255.0, alpha: 1.0)
        #elseif os(OSX)
        node.particleColor = SKColor(red: 171 / 255.0, green: 80 / 255.0, blue: 21 / 255.0, alpha: 1.0)
        #endif
        node.particleBlendMode = .add
        node.particleColorBlendFactor = 0.8
        node.particleColorBlendFactorRange = 1
        node.particleColorBlendFactorSpeed = 1
        node.particleColorBlendFactorSequence = nil
        
        node.particleColorRedRange = 0.8
        node.particleColorRedSpeed = 0.5
        node.particleColorGreenRange = 0.8
        node.particleColorGreenSpeed = 0.5
        node.particleColorBlueRange = 0.8
        node.particleColorBlueSpeed = 0.5
        node.particleColorAlphaRange = 0.9
        
        
        node.position = point
        addChild(node)
    }
    
    @objc func launchFireworks() {
        explosion(
            at: CGPoint(
                x: Int.random(in: 0...Int(size.width)),
                y: Int.random(in: 0...Int(size.height))
            )
        )
    }
}
