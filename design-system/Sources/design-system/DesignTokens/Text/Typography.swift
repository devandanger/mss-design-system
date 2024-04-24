//
//  Typography.swift
//  design-system
//
//  Created by Evan Anger on 4/13/23.
//

import Foundation
import SwiftUI

extension View {
    func title() -> some View {
        self
            .font(.custom("OpenDyslexic-Bold", size: 24))
    }
    func title2() -> some View {
        self
            .font(.custom("OpenDyslexic-Bold", size: 20))
    }
    func title3() -> some View {
        self
            .font(.custom("OpenDyslexic-Regular", size: 16))
    }
    
    func bodyCopy() -> some View {
        self
            .font(.custom("OpenDyslexic-Regular", size: 12))
    }
}


import UIKit

public func registerFonts() {
    _ = UIFont.registerFont(bundle: .module, fontName: "OpenDyslexic-Regular", fontExtension: "otf")
    _ = UIFont.registerFont(bundle: .module, fontName: "OpenDyslexic-BoldItalic", fontExtension: "otf")
    _ = UIFont.registerFont(bundle: .module, fontName: "OpenDyslexic-Italic", fontExtension: "otf")
    _ = UIFont.registerFont(bundle: .module, fontName: "OpenDyslexic-Bold", fontExtension: "otf")
}

extension UIFont {
    static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) -> Bool {

        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension) else {
            fatalError("Couldn't find font \(fontName)")
        }

        guard let fontDataProvider = CGDataProvider(url: fontURL as CFURL) else {
            fatalError("Couldn't load data from the font \(fontName)")
        }

        guard let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }

        var error: Unmanaged<CFError>?
        let success = CTFontManagerRegisterGraphicsFont(font, &error)
        guard success else {
            print("Error registering font: maybe it was already registered.")
            return false
        }

        return true
    }
}
