//
//  EffectsViewRepresentable.swift
//  
//
//  Created by Stefan Blos on 31.03.22.
//

import SwiftUI

protocol EffectsViewRepresentable: UIViewRepresentable {
    
    associatedtype Config: BaseConfig
    
    var proxy: GeometryProxy { get }
    var config: Config { get }
    
    var emitterPositionY: CGFloat { get }
    var scale: CGFloat { get }
    
    func createView() -> UIView
    func createBaseView() -> UIView
    func createBaseLayer() -> CAEmitterLayer
    //    func calculateEmitterYPosition() -> CGFloat
    
    func createCell(with content: Content) -> CAEmitterCell
}

extension EffectsViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        return createView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // Todo
    }
}

extension EffectsViewRepresentable {
    
    var emitterPositionY: CGFloat {
        switch config.emitterPosition {
        case .top:
            return 0
        case .center:
            return proxy.size.height / 2
        case .bottom:
            return proxy.size.height
        }   
    }
    
    var scale: CGFloat {
        return proxy.size.width / UIScreen.main.bounds.width
    }
    
    func createView() -> UIView {
        let baseView = createBaseView()
        let baseLayer = createBaseLayer()
        
        let cells = config.content.map { content in
            return createCell(with: content)
        }
        
        baseLayer.emitterCells = cells
        baseView.layer.addSublayer(baseLayer)
        
        return baseView
    }
    
    func createBaseView() -> UIView {
        let baseView = UIView()
        baseView.backgroundColor = UIColor(config.backgroundColor)
        baseView.clipsToBounds = config.clipsToBounds
        
        return baseView
    }
    
    func createBaseLayer() -> CAEmitterLayer {
        let containerLayer = CAEmitterLayer()
        containerLayer.name = "Container"
        containerLayer.bounds = CGRect(x: 0, y: 0, width: proxy.size.width, height: proxy.size.height)
        containerLayer.anchorPoint = CGPoint(x: 0, y: 0)
        containerLayer.backgroundColor = UIColor(config.backgroundColor).cgColor
        //        containerLayer.emitterPosition = CGPoint(x: proxy.size.width / 2, y: calculateEmitterYPosition())
        containerLayer.emitterPosition = CGPoint(x: proxy.size.width / 2, y: emitterPositionY)
        
        return containerLayer
    }
    
    //    func calculateEmitterYPosition() -> CGFloat {
    //        switch config.emitterPosition {
    //        case .top:
    //            return 0
    //        case .center:
    //            return proxy.size.height / 2
    //        case .bottom:
    //            return proxy.size.height
    //        }
    //    }
}
