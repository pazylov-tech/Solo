//
//  AuthView.swift
//  Solo
//

import SwiftUI

struct AuthView: View {
    @StateObject var viewModel = AuthViewModel()
    @State private var isLoginMode = true
    
    var body: some View {
        header
        
        VStack (spacing: 15) {
            Picker("", selection: $isLoginMode) {
                Text("Sign In").tag(true)
                Text("Sign Up").tag(false)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal, 16)
            
            VStack(spacing: 12) {
                if !isLoginMode {
                    AppField(placeholder: "Name", text: $viewModel.name)
                }
                
                AppField(placeholder: "Email", text: $viewModel.email)
                AppField(placeholder: "Password", text: $viewModel.password)
            }
    
            MainButton(title: isLoginMode ? "SIGN IN" : "SIGN UP") {
                // auth action
            }
        }

    }
}

extension AuthView {
    var header: some View {
        
        VStack (spacing: 15) {
            Image("solo-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 6)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            Text("Solo Trip")
                .font(.system(size: 26, weight: .bold, design: .rounded))
        }
        .padding(.bottom, 30)

    }
}

#Preview {
    AuthView()
}
