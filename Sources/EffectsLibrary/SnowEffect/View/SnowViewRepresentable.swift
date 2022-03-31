//
//  SnowViewRepresentable.swift
//  
//
//  Created by Stefan Blos on 11.03.22.
//

import SwiftUI

struct SnowViewRepresentable: EffectsViewRepresentable {
    
    var proxy: GeometryProxy
    var config: SnowConfig

    func createCell(with content: Content) -> CAEmitterCell {
        let cell = CAEmitterCell()
        
        cell.contents = content.image.cgImage
        cell.contentsScale = scale / content.scale
        cell.contentsScale = 10
        cell.scale = 0.05
        cell.scaleRange = 0.2
        cell.scaleSpeed = 0.03
        cell.magnificationFilter = CALayerContentsFilter.nearest.rawValue
        cell.minificationFilter = CALayerContentsFilter.nearest.rawValue
        cell.spin = 3.4
        cell.spinRange = 0.1
        cell.velocity = config.velocityValue
        cell.velocityRange = 8
        cell.xAcceleration = 0.2
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
        
        if let color = content.color {
            cell.color = color.cgColor
        }
        
        return cell
    }
}
