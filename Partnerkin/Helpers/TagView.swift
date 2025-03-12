//
//  TagView.swift
//  Partnerkin
//
//  Created by Владислав Соколов on 12.03.2025.
//

import SwiftUI

struct TagView: View {
    let text: String
    let color: Color
    
    var body: some View {
        Text(text)
            .customFont(type: .interSemibold, size: 11)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(color)
            .cornerRadius(20)
    }
}
