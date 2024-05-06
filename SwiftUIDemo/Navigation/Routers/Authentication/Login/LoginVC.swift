//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Himanshu on 22/03/24.
//

import SwiftUI
import SSToastMessage

struct LoginVC: View {
    
    @ObservedObject private var viewModel = LoginVM()
    @EnvironmentObject private var appRootManager: AppRootManager
    @FocusState var focus:FormTextFieldDecoratable?
    
    var body: some View {
        NavigationStack {
            ScrollView{
                ZStack {
                    VStack(spacing: 0) {
                        GreetingHeader(decorableData: .login)
                        Image(.HimanshuTextLogo)
                            .padding(.top, 30)
                        form
                        Button {
//                            viewModel.showMessage = true
                            if viewModel.validation() {
                                viewModel.loginApi { result in
                                    if result {
                                        UserDefaults.standard.setValues(true, forKey: .isUserLogged)
                                        appRootManager.currentRoot = .homeVC
                                    }
                                }
                            }
                        } label: {
                            Text("action.login".localized())
                                .customFont(.semiBold, size: 14)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, minHeight: 52)
                                .background(Color.font_blue)
                            
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .padding(.horizontal, 20)
                        
                        Text("auth.text.options.socialmedia".localized())
                            .customFont(.medium, size: 14)
                            .foregroundColor(.font_gray)
                            .padding(.top, 18)
                            .padding(.bottom, 24)
                        
                        VStack(spacing: 0) {
                            SocialMediaButton(icon: "GoogleIcon", text: "auth.google.signin".localized())
                                .padding(.bottom, 18)
                            SocialMediaButton(icon: "facebookIcon", text: "auth.facebook.signin".localized())
                        }
                        .padding(.horizontal, 20)
                        
                        HStack(spacing: 3) {
                            Text("auth.text.notaccount".localized())
                                .customFont(.medium, size: 14)
                            NavigationLink {
                                SignInVC()
                            } label: {
                                VStack(spacing: 0) {
                                    Text("action.createhere".localized())
                                        .customFont(.semiBold, size: 14)
                                        .foregroundColor(.font_blue)
                                    Rectangle()
                                        .fill(Color.font_blue)
                                        .frame(height: 1)
                                }
                                .frame(width: 81, height: 19)
                            }

                        }
                        .padding(.top, 24)
                        Spacer()
                    }
                }
                .navigationBarBackButtonHidden()
            }
            .baseViewmodelModify(viewModel: self.viewModel)
            .scrollBounceBehavior(.basedOnSize, axes: .vertical)
            .ignoresSafeArea()
        }
       
    }
    
    private var form: some View {
        VStack(alignment: .leading, spacing: 0) {
            FormTextFiled(model: viewModel.usernameTextFiled)
                .keyboardType(.emailAddress)
                .padding(.bottom, 18)
                .focused($focus, equals: .username)
                .onSubmit {
                    focus = .password
                }
            FormTextFiled(model: viewModel.passwordTextFiled)
                .focused($focus, equals: .password)
            HStack(spacing: 0) {
                Spacer()
                Button {
                    
                } label: {
                    Text("action.forgot.password".localized())
                        .customFont(.semiBold, size: 14)
                        .foregroundColor(.font_blue)
                        .padding(.top, 16)
                }
            }
        }
        .constrain(Top: 30, Leading: 20, Bottom: 18, Traling: 20)
    }
}

#Preview {
    LoginVC()
}
