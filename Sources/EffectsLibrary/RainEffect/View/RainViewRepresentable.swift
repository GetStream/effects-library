//
//  RainViewRepresentable.swift
//  
//
//  Created by Stefan Blos on 17.03.22.
//

import SwiftUI

struct RainViewRepresentable: EffectsViewRepresentable {
    
    var proxy: GeometryProxy
    var config: RainConfig
    
    func createCell(with content: Content) -> CAEmitterCell {
        let cell = CAEmitterCell()
        
        cell.contentsScale = 1 / content.scale
        cell.scaleRange = 0.02
        cell.scaleSpeed = -0.005
        cell.magnificationFilter = CALayerContentsFilter.trilinear.rawValue
        cell.minificationFilter = CALayerContentsFilter.trilinear.rawValue
        cell.minificationFilterBias = -25
        cell.spinRange = 0.1
        cell.velocity = config.velocityValue
        cell.velocityRange = 8
        cell.xAcceleration = 50
        switch config.fallDirection {
        case .downwards:
            cell.yAcceleration = 200
        case .upwards:
            cell.yAcceleration = -200
        }
        cell.zAcceleration = 50
        cell.emissionRange = config.spreadRadiusValue
        cell.birthRate = config.birthRateValue
        cell.lifetime = config.lifetimeValue
        cell.lifetimeRange = 4
        cell.redRange = 0.3
        cell.redSpeed = 0.5
        cell.greenRange = 0.3
        cell.greenSpeed = 0.5
        cell.blueRange = 0.3
        cell.blueSpeed = 0.5
        cell.alphaRange = 0.9
        cell.alphaSpeed = config.alphaSpeedValue
        cell.fillMode = .forwards
        
        cell.contents = content.image.cgImage
        if let color = content.color {
            cell.color = color.cgColor
        }
        
        return cell
    }
}
