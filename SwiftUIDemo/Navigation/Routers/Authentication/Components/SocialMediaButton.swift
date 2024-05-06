//
//  SocialMediaButton.swift
//  SwiftUIDemo
//
//  Created by Himanshu on 23/03/24.
//

import SwiftUI

struct SocialMediaButton: View {
    let icon: String
    let text: String
    
    
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Image(icon)
            Text(text)
                .foregroundStyle(Color.font_Black)
                .customFont(.semiBold, size: 14)
                .padding(.leading, 10)
        }
        .frame(maxWidth: .infinity, maxHeight: 52)
        .background(Color.white)
        .overlay {
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color.border_LightGray, lineWidth: 1)
        }
        .frame(maxWidth: .infinity, minHeight: 52)
    }
}

#Preview {
    ZStack{
        Color.white
        SocialMediaButton(icon: "GoogleIcon", text: "Sign In with Google")
    }
    .ignoresSafeArea()
    
}
