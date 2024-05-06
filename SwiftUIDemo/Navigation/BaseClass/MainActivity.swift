//
//  mainActivity.swift
//  SwiftUIDemo
//
//  Created by Himanshu on 27/03/24.
//


import IQKeyboardManagerSwift
import SwiftUI

@main
struct MainActivity: App {
    
    @StateObject private var appRootManager = AppRootManager()
    
    var body: some Scene {

            WindowGroup {
                Group {
                    switch appRootManager.currentRoot {
                    case .authentication:
                        LoginVC()
                    case .homeVC:
                        HomeVC()
                    }
                }
                .environmentObject(appRootManager)
                .onAppear{
                    //on load application
                    
                    IQKeyboardManager.shared.enable = true
                    IQKeyboardManager.shared.resignOnTouchOutside = true
                    IQKeyboardManager.shared.toolbarConfiguration.previousNextDisplayMode = .alwaysShow
                    IQKeyboardManager.shared.keyboardDistanceFromTextField = 200
                    appRootManager.currentRoot = UserDefaults.standard.getValue(forKey: .isUserLogged) as? Bool ?? false ? .homeVC : .authentication
                }
            }

    }
}
