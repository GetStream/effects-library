//
//  File.swift
//  
//
//  Created by Stefan Blos on 17.03.22.
//

import SwiftUI

#if os(iOS) || os(watchOS)
extension UIImage {
    
    public static func loadFromBundle(named name: String) -> UIImage {
        return UIImage(named: name, in: Bundle.module, with: .none)!.withRenderingMode(.alwaysTemplate)
    }
    
}
#elseif os(OSX)
extension NSImage {
    /// A helpful blog post that displayed how to correctly load images on macOS in Swift Packages:
    /// https://www.enekoalonso.com/articles/displaying-images-in-swiftui-views-from-swift-package-resources
    public static func loadFromBundle(named name: String) -> NSImage {
        if let path = Bundle.module.path(forResource: name, ofType: "png"), let image = NSImage(contentsOfFile: path) {
            return image
        }
        return NSImage(contentsOfFile: Bundle.module.path(forResource: "spark", ofType: "png")!)!
    }
}
#endif
