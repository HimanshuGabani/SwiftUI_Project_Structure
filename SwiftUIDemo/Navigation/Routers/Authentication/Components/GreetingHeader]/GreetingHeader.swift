//
//  GreetingHeader.swift
//  SwiftUIDemo
//
//  Created by Himanshu on 23/03/24.
//

import SwiftUI

struct GreetingHeader: View {
    let decorableData: GreetingDecoratbleData
    var body: some View {
        ZStack {
            Image(.greetingHeaderBG)
                .resizable()
            texts
        }
        .frame(maxWidth: .infinity, maxHeight: 160)
        
    }
    
    var texts: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0){
                Spacer()
                Text(("greeting.head."+decorableData.rawValue).localized())
                    .customFont(.bold, size: 22)
                    .foregroundColor(.font_Black)
                
                Text(("greeting.sublines."+decorableData.rawValue).localized())
                    .customFont(.medium, size: 14)
                    .foregroundColor(.font_gray)
                
            }
            .frame(width: 195)
            .constrain(Leading: 20, Bottom: 28)
            Spacer()
        }
    }
}

#Preview {
    ZStack {
        Color.black
        GreetingHeader(decorableData: .login)
    }
    .ignoresSafeArea()
        
}
