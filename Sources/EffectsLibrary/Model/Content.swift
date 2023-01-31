//
//  Content.swift
//  
//
//  Created by Stefan Blos on 10.03.22.
//

import SwiftUI

/// Content is the building blocks of what the effects are constituted of.
/// These can be configured when creating the effects.
public enum Content {
    
    public enum Shape {
        case circle
        case triangle
        case square
        case custom(CGPath)
    }
    
    case shape(Shape, Color?, CGFloat = 1)
    case image(MyImage, Color?, CGFloat = 1)
    case emoji(Character, CGFloat = 1)
}

extension Content {
    var color: Color? {
        switch self {
        case let .image(_, color?, _),
            let .shape(_, color?, _):
            return color
        default:
            return nil
        }
    }
    
    @MainActor var image: MyImage {
        switch self {
        case let .image(image, _, _):
            return image
        case let .shape(shape, color, _):
            return shape.image(with: color ?? .white)
        case let .emoji(character, _):
            return "\(character)".image()
        }
    }
    
    var scale: CGFloat {
        switch self {
        case .shape(_, _, let scale):
            return scale
        case .image(_, _, let scale):
            return scale
        case .emoji(_, let scale):
            return scale
        }
    }
}

extension Content.Shape {
    func path(in rect: CGRect) -> CGPath {
        switch self {
        case .circle:
            return CGPath(ellipseIn: rect, transform: nil)
        case .triangle:
            let path = CGMutablePath()
            path.addLines(between: [
                CGPoint(x: rect.midX, y: 0),
                CGPoint(x: rect.maxX, y: rect.maxY),
                CGPoint(x: rect.minX, y: rect.maxY),
                CGPoint(x: rect.midX, y: 0)
            ])
            return path
        case .square:
            return CGPath(rect: rect, transform: nil)
        case .custom(let path):
            return path
        }
    }
#if os(iOS) || os(watchOS)
    func image(with color: Color) -> MyImage {
        let rect = CGRect(origin: .zero, size: CGSize(width: 12.0, height: 12.0))

        return UIGraphicsImageRenderer(size: rect.size).image { context in
            if let unwrappedCGColor = color.cgColor {
                context.cgContext.setFillColor(unwrappedCGColor)
            }
            context.cgContext.addPath(path(in: rect))
            context.cgContext.fillPath()
        }
    }
#elseif os(OSX)
    @MainActor func image(with color: Color) -> MyImage {
        let viewToRender = Path { context in
            context.addPath(Path(CGPath(rect: CGRect(origin: .zero, size: CGSize(width: 12.0, height: 12.0)), transform: nil)))
            context.fill()
        }

        let renderer = ImageRenderer(content: viewToRender)
        return renderer.nsImage!
    }
#endif
}

extension String {
#if os(iOS) || os(watchOS)
    func image(with font: UIFont = UIFont.systemFont(ofSize: 16.0)) -> MyImage {
        let string = NSString(string: "\(self)")
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font
        ]
        let size = string.size(withAttributes: attributes)

        return UIGraphicsImageRenderer(size: size).image { _ in
            string.draw(at: .zero, withAttributes: attributes)
        }
    }
#elseif os(OSX)
    @MainActor func image(with font: NSFont = .systemFont(ofSize: 16.0)) -> MyImage {
        let textView = Text("\(self)")
            .font(Font(font))

        let renderer = ImageRenderer(content: textView)
        return renderer.nsImage!
    }
#endif
}
