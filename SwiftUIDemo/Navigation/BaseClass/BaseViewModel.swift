//
//  BaseViewModel.swift
//  SwiftUIDemo
//
//  Created by Himanshu on 01/04/24.
//

import Foundation
import Combine
import SwiftUI


enum ViewModelState {
    /// Indicates that an error occurred during data refreshing.
    case error(error: Error)
    /// Indicates that no data refreshing has occurred during view model lifecycle.
    case initial
    /// Indicates that new data have appeared.
    case loaded
    /// Indicates that new data are being fetched.
    case loading
}

struct MessageDecoratable {
    var text: String
    var type: MessageDecoration
}

extension ViewModelState: Equatable {
    static func ==(lhs: Self, rhs: Self) -> Bool {
        switch((lhs, rhs)) {
        case (.error, .error):
            return true
        case (.initial, .initial):
            return true
        case (.loaded, .loaded):
            return true
        case (.loading, .loading):
            return true
        default:
            break
        }
        return false
    }
}

class BaseViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published var state: ViewModelState = .initial
    @Published var showMessage = false
    @Published var message: MessageDecoratable?
  
}


extension BaseViewModel {
    func showMessage(text: String, type: MessageDecoration) {
        message = .init(text: text, type: type)
        showMessage = true
    }
}
  

struct BaseViewModelModifier: ViewModifier {
    @ObservedObject var viewModel: BaseViewModel
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .present(isPresented: $viewModel.showMessage, type: .floater(verticalPadding: 50), position: .top) {
                    MessageView(text: viewModel.message?.text ?? "", type: viewModel.message?.type ?? .plain)
                }
            if viewModel.state == .loading {
                LoderView()
            }
        }
    }
}
