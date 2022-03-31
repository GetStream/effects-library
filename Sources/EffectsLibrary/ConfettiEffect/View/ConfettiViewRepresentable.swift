//
//  ConfettiViewRepresentable.swift
//  
//
//  Created by Stefan Blos on 10.03.22.
//

import SwiftUI

struct ConfettiViewRepresentable: EffectsViewRepresentable {
    
    var proxy: GeometryProxy
    var config: ConfettiConfig
    
    var viewRenderMode: CAEmitterLayerRenderMode {
        return .unordered
    }
    
    func createCell(with content: Content) -> CAEmitterCell {
        let cell = CAEmitterCell()
        
        cell.contentsScale = (0.1 / scale) / content.scale
        cell.scale = 0.01 / scale
        cell.scaleRange = 0.2
        cell.scaleSpeed = 0.03
        cell.spinRange = 0.1
        cell.velocity = config.velocityValue
        cell.velocityRange = 8
        cell.xAcceleration = -0.2
        switch config.fallDirection {
        case .downwards:
            cell.yAcceleration = 200
        case .upwards:
            cell.yAcceleration = -200
        }
        cell.zAcceleration = -50
        cell.emissionRange = config.spreadRadiusValue
        cell.birthRate = config.birthRateValue
        cell.lifetime = config.lifetimeValue
        cell.lifetimeRange = 4
        cell.fillMode = .forwards
        cell.alphaRange = 0.5
        cell.alphaSpeed = config.alphaSpeedValue
        cell.contents = content.image.cgImage
        if let color = content.color {
            cell.color = color.cgColor
        }
        
        return cell
    }
}
