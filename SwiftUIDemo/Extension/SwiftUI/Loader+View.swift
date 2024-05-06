//
//  Loader+View.swift
//  SwiftUIDemo
//
//  Created by Himanshu on 03/04/24.
//

import SwiftUI

extension View {
    func loadingIndicator(viewModel: BaseViewModel) -> some View {
        self.modifier(LoadingModifier(viewModel: viewModel))
    }
    
    func showMessage(viewModel: BaseViewModel) -> some View {
        self.modifier(MessageModifier(viewModel: viewModel))
    }
    
    func baseViewmodelModify(viewModel: BaseViewModel) -> some View {
        self.modifier(BaseViewModelModifier(viewModel: viewModel))
    }
    
}
