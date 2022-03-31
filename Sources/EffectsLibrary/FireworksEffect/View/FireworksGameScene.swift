//
//  FireworksGameScene.swift
//  
//
//  Created by Stefan Blos on 31.03.22.
//

import SpriteKit

class GameScene: SKScene {
    
    var config: FireworksConfig
    
    var timeInterval: Double {
        switch config.intensity {
        case .low:
            return 1.5
        case .medium:
            return 0.5
        case .high:
            return 0.1
        }
    }
    
    init(size: CGSize, config: FireworksConfig) {
        self.config = config
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(launchFireworks), userInfo: nil, repeats: true)
    }
    
    func explosion(at point: CGPoint) {
        let node = SKEmitterNode()
        node.particleTexture = SKTexture(image: UIImage.loadFromBundle(named: "spark"))
        
        // Particle General
        node.particleBirthRate = 2048
        node.numParticlesToEmit = 256
        node.particleLifetime = 0.5
        node.yAcceleration = -500
        
        // Particle Speed
        node.particleSpeed = 200
        node.particleSpeedRange = 200
        
        // Particle Angle
        node.emissionAngle = .pi * 2
        node.emissionAngleRange = .pi * 2
        
        // Particle Alpha
        node.particleAlpha = 0.8
        node.particleAlphaSpeed = -1.4
        node.particleAlphaRange = 0.2
        
        // Particle Scale
        node.particleScale = 0.15
        
        // Particle Color
        node.particleColor = UIColor(red: 171 / 255.0, green: 80 / 255.0, blue: 21 / 255.0, alpha: 1.0)
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
