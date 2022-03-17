//
//  RainViewRepresentable.swift
//  
//
//  Created by Stefan Blos on 17.03.22.
//

import SwiftUI

struct RainViewRepresentable: UIViewRepresentable {
    
    var proxy: GeometryProxy
    var config: RainConfig
    
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
        containerLayer.renderMode = .additive
        containerLayer.fillMode = .forwards
        containerLayer.allowsGroupOpacity = true
        containerLayer.allowsEdgeAntialiasing = true
        
        
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
        
        cell.contentsScale = 1 / scale
        cell.scale = 0.005 / scale
        cell.scaleRange = 0.02
        cell.scaleSpeed = -0.005
        cell.magnificationFilter = CALayerContentsFilter.trilinear.rawValue
        cell.minificationFilter = CALayerContentsFilter.trilinear.rawValue
        cell.minificationFilterBias = -25
        cell.spinRange = 0.1
        cell.velocity = 250
        cell.velocityRange = 8
        cell.xAcceleration = 50
        switch config.fallDirection {
        case .downwards:
            cell.yAcceleration = 200
        case .upwards:
            cell.yAcceleration = -200
        }
        cell.zAcceleration = 50
        cell.emissionRange = 6.284
        cell.birthRate = config.birthRate
        cell.lifetime = config.lifetime
        cell.lifetimeRange = 4
        cell.redRange = 0.3
        cell.redSpeed = 0.5
        cell.greenRange = 0.3
        cell.greenSpeed = 0.5
        cell.blueRange = 0.3
        cell.blueSpeed = 0.5
        cell.alphaRange = 0.9
        cell.alphaSpeed = 0.5
        cell.fillMode = .forwards
        
        cell.contents = content.image.cgImage
        if let color = content.color {
            cell.color = color.cgColor
        }
        
        return cell
    }
}

struct RainViewRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        RainView(
            config:
                RainConfig(
                    emitterPosition: .top,
                    clipsToBounds: false,
                    birthRate: 300,
                    lifetime: 10
                )
        )
    }
}

