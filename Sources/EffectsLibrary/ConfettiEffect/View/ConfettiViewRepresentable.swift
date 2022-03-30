//
//  File.swift
//  
//
//  Created by Stefan Blos on 10.03.22.
//

import SwiftUI

struct ConfettiViewRepresentable: UIViewRepresentable {
    
    var proxy: GeometryProxy
    var config: ConfettiConfig
    
    fileprivate var birthRate: Float {
        switch config.intensity {
        case .low:
            return 8
        case .medium:
            return 25
        case .high:
            return 50
        }
    }
    
    fileprivate var lifetime: Float {
        switch config.lifetime {
        case .short:
            return 4
        case .medium:
            return 10
        case .long:
            return 20
        }
    }
    
    fileprivate var scale: CGFloat {
        return proxy.size.width / UIScreen.main.bounds.width
    }
    
    fileprivate var emitterYPosition: CGFloat {
        switch config.emitterPosition {
        case .top:
            return 0
        case .center:
            return proxy.size.height / 2
        case .bottom:
            return proxy.size.height
        }
    }
    
    func makeUIView(context: Context) -> some UIView {
        return createView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // Todo
    }
    
    fileprivate func createView() -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = UIColor(config.backgroundColor)
        containerView.clipsToBounds = config.clipsToBounds
        
        let containerLayer = CAEmitterLayer()
        containerLayer.name = "Container"
        containerLayer.bounds = CGRect(x: 0, y: 0, width: proxy.size.width, height: proxy.size.height)
        containerLayer.anchorPoint = CGPoint(x: 0, y: 0)
        containerLayer.backgroundColor = UIColor(config.backgroundColor).cgColor
        containerLayer.emitterPosition = CGPoint(x: proxy.size.width / 2, y: emitterYPosition)
        
        // Emitter Cells
        let cells = configure(with: config.content)
        
        containerLayer.emitterCells = cells
        containerView.layer.addSublayer(containerLayer)
        
        return containerView
    }
    
    fileprivate func configure(with contents: [Content]) -> [CAEmitterCell] {
        return contents.map { content in
            return createCell(with: content)
        }
    }
    
    fileprivate func createCell(with content: Content) -> CAEmitterCell {
        let cell = CAEmitterCell()
        
        cell.contentsScale = 0.1 / scale
        cell.scale = 0.01 / scale
        cell.scaleRange = 0.2
        cell.scaleSpeed = 0.03
        cell.spinRange = 0.1
        cell.velocity = 100
        cell.velocityRange = 8
        cell.xAcceleration = -0.2
        switch config.fallDirection {
        case .downwards:
            cell.yAcceleration = 200
        case .upwards:
            cell.yAcceleration = -200
        }
        cell.zAcceleration = -50
        cell.emissionRange = 6.284
        cell.birthRate = birthRate
        cell.lifetime = lifetime
        cell.lifetimeRange = 4
        cell.fillMode = .forwards
        cell.contents = content.image.cgImage
        if let color = content.color {
            cell.color = color.cgColor
        }
        
        return cell
    }
}
