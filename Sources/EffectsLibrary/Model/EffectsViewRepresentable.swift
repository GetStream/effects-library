//
//  EffectsViewRepresentable.swift
//  
//
//  Created by Stefan Blos on 31.03.22.
//

import SwiftUI

#if os(iOS) || os(watchOS)
protocol EffectsViewRepresentable: UIViewRepresentable {
    
    associatedtype Config: EmitterLayerConfig
    
    var proxy: GeometryProxy { get }
    var config: Config { get }
    
    var emitterPositionY: CGFloat { get }
    var viewRenderMode: CAEmitterLayerRenderMode { get }
    
    func createView() -> UIView
    func createBaseView() -> UIView
    func createBaseLayer() -> CAEmitterLayer
    
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
#elseif os(OSX)
protocol EffectsViewRepresentable: NSViewRepresentable {
    
    associatedtype Config: EmitterLayerConfig
    
    var proxy: GeometryProxy { get }
    var config: Config { get }
    
    var emitterPositionY: CGFloat { get }
    var viewRenderMode: CAEmitterLayerRenderMode { get }
    
    func createView() -> NSView
    func createBaseView() -> NSView
    func createBaseLayer() -> CAEmitterLayer
    
    func createCell(with content: Content) -> CAEmitterCell
}

extension EffectsViewRepresentable {
    func makeNSView(context: Context) -> some NSView {
        return createView()
    }
    
    func updateNSView(_ uiView: NSViewType, context: Context) {
        // Todo
    }
}
#endif

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
    
    var viewRenderMode: CAEmitterLayerRenderMode {
        return .additive
    }
}

extension EffectsViewRepresentable {
    
    #if os(iOS) || os(watchOS)
    typealias MyView = UIView
    #elseif os(OSX)
    typealias MyView = NSView
    #endif
    
    func createView() -> MyView {
        let baseView = createBaseView()
        let baseLayer = createBaseLayer()
        
        let cells = config.content.map { content in
            return createCell(with: content)
        }
        
        baseLayer.emitterCells = cells
        baseView.layer?.addSublayer(baseLayer)
        
        return baseView
    }
    
    func createBaseView() -> MyView {
        let baseView = MyView()
        #if os(iOS) || os(watchOS)
        baseView.backgroundColor = config.backgroundColor
        baseView.clipsToBounds = config.clipsToBounds
        #elseif os(OSX)
        baseView.layer?.backgroundColor = config.backgroundColor.cgColor
        baseView.layer?.masksToBounds = config.clipsToBounds
        #endif
        
        return baseView
    }
    
    func createBaseLayer() -> CAEmitterLayer {
        let containerLayer = CAEmitterLayer()
        containerLayer.name = "Container"
        containerLayer.bounds = CGRect(x: 0, y: 0, width: proxy.size.width, height: proxy.size.height)
        containerLayer.anchorPoint = CGPoint(x: 0, y: 0)
        containerLayer.backgroundColor = config.backgroundColor.cgColor
        containerLayer.emitterPosition = CGPoint(x: proxy.size.width / 2, y: emitterPositionY)
        containerLayer.fillMode = .forwards
        containerLayer.renderMode = viewRenderMode
        
        return containerLayer
    }
}
