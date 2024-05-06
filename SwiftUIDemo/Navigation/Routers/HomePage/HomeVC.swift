//
//  HomeVC.swift
//  SwiftUIDemo
//
//  Created by Himanshu on 26/03/24.
//

import SwiftUI

struct HomeVC: View {
    
    @EnvironmentObject private var appRootManager: AppRootManager
    @State var viewModel = HomeVM()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Spacer()
                Button {
                    viewModel.callLogOutAPI { response in
                        if response {
                            UserDefaults.standard.setValues(false, forKey: .isUserLogged)
                            UserDefaults.standard.removeObject(forKey: .userData)
                            
                            appRootManager.currentRoot = .authentication
                        }
                    }
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.forward")
                }
            }
            .padding(.horizontal, 24)
            .frame(height: 50)
            .background {
                Text( "Hello " + (viewModel.userData?.data.name ?? ""))
                    .customFont(.medium, size: 22)
            }
            Spacer()
        }
        .loadingIndicator(viewModel: viewModel)
        .background{
            Image(.HimanshuTextLogo)
            
        }
    }
}

//#Preview {
//    HomeVC()
//}
