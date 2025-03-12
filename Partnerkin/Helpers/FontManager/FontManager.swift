//
//  FontManager.swift
//  Partnerkin
//
//  Created by Владислав Соколов on 12.03.2025.
//

import SwiftUI

enum FontManager: String {
    case interRegular = "Inter-Regular"
    case interSemibold = "Inter-Regular_SemiBold"
    case interBold = "Inter-Regular_Bold"
}

extension View {
    func customFont(type: FontManager, size: CGFloat = 12) -> some View {
        modifier(CustomFont(font: type, size: size))
    }
}

struct CustomFont: ViewModifier {
    var font: FontManager
    var size: CGFloat
    func body(content: Content) -> some View {
        content
            .font(.custom(font.rawValue, size: size))
    }
}
