//
//  RootControler.swift
//  SwiftUIDemo
//
//  Created by Himanshu on 27/03/24.
//

import Foundation
import SwiftUI

final class AppRootManager: ObservableObject {
    
    @Published var currentRoot: eAppRoots = .authentication
    @Published var viewControllers: [AnyView] = []
    
    
    enum eAppRoots {
        case authentication
        case homeVC
    }
}
