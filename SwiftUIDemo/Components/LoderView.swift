//
//  Lodder.swift
//  SwiftUIDemo
//
//  Created by Devsto on 01/04/24.
//

import SwiftUI
import UIKit

struct LoderView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .frame(width: 220, height: 220)
            VStack(spacing: 20) {
                Image(.HimanshuTextLogo)
                ProgressView()
                    .controlSize(.large)
                    .tint(.font_blue)
                    .background(Color.clear)
                    .padding(.top, 20)
            }
        }
        .ignoresSafeArea()
    }
}


struct LoadingModifier: ViewModifier {
    @ObservedObject var viewModel: BaseViewModel // Replace YourViewModel with your actual view model type

    func body(content: Content) -> some View {
        ZStack {
            content
            if viewModel.state == .loading {
                LoderView()
            }
        }
    }
}

struct MessageModifier: ViewModifier {
    @ObservedObject var viewModel: BaseViewModel
    
    func body(content: Content) -> some View {
        content
            .present(isPresented: $viewModel.showMessage, type: .floater(verticalPadding: 50), position: .top) {
                MessageView(text: viewModel.message?.text ?? "", type: viewModel.message?.type ?? .plain)
            }
    }
}




#Preview {
    LoderView()
}
