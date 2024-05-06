//
//  MessageView.swift
//  SwiftUIDemo
//
//  Created by Himanshu on 03/04/24.
//

import SwiftUI

enum MessageDecoration {
    case error
    case success
    case plain
    
    
    var backgroundColor: Color {
        switch self {
        case .success:
            return .green.opacity(0.95)
        case .plain, .error:
            return .white
        }
    }
    
    var textColor: Color {
        switch self {
        case .error:
            return .red
        case .success, .plain:
            return .black
        }
    }
}

struct MessageView: View {
    var text: String
    var type: MessageDecoration
    var body: some View {
        HStack(spacing: 0) {
            Image(.HimanshuLogo)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .frame(width: 50, height: 70)
                .padding(.horizontal, 16)
            Text(text)
                .foregroundColor(type.textColor)
                .customFont(.medium, size: 16)
                .constrain(Top: 12, Bottom: 12, Traling: 16)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity)
        .background(type.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .shadow(color: .black.opacity(0.3), radius: 6, x: 4, y: 4)
        .padding(.horizontal, 24)
    }
}

#Preview {
    MessageView(text: "This is Himanshu Message", type: .success)
}
