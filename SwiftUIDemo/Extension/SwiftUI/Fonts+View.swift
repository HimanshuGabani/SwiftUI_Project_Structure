//
//  Fonts+View.swift
//  SwiftUIDemo
//
//  Created by Himanshu on 23/03/24.
//

import SwiftUI

extension View {
    func customFont(_ font: Manrope, size: CGFloat) -> some View {
        return self.customFont(font.rawValue, size: size)
    }

    func customFont(_ name: String, size: CGFloat) -> some View {
        return self.font(.custom(name, size: size))
    }
}
