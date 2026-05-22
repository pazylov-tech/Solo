//
//  AuthView.swift
//  Solo
//

import SwiftUI

struct AuthView: View {
    @StateObject var viewModel = AuthViewModel()
    @State private var isLoginMode = true
    
    private var canLogin: Bool {
        !viewModel.email.isEmpty &&
        !viewModel.password.isEmpty
    }
    private var canRegister: Bool {
        !viewModel.firstName.isEmpty &&
        !viewModel.lastName.isEmpty &&
        !viewModel.dateOfBirth.isEmpty &&
        !viewModel.gender.isEmpty &&
        !viewModel.phoneNumber.isEmpty &&
        !viewModel.email.isEmpty &&
        !viewModel.password.isEmpty
    }
    
    var body: some View {
        header
        
        VStack (spacing: 20) {
            Picker("", selection: $isLoginMode) {
                Text("Sign In").tag(true)
                Text("Sign Up").tag(false)
            }
            .pickerStyle(.palette)
            .padding(.horizontal, 16)
            
            VStack (spacing: 12) {
                if !isLoginMode {
                    AppField(icon: "person", placeholder: "First Name", text: $viewModel.firstName)
                    AppField(icon: "person", placeholder: "Last Name", text: $viewModel.lastName)
                    AppField(icon: "calendar", placeholder: "Date of Birth", text: $viewModel.dateOfBirth)
                    PickerField(icon: "person.2", placeholder: "Gender", options: ["Male", "Female", "Other"], selection: $viewModel.gender)
                    AppField(icon: "phone", placeholder: "Phone Number", text: $viewModel.phoneNumber)
                }
                AppField(icon: "envelope", placeholder: "Email", text: $viewModel.email)
                AppField(icon: "lock", placeholder: "Password", text: $viewModel.password)
            }
            
            MainButton(title: isLoginMode ? "LOGIN" : "REGISTER") {
                    // AuthAction -> to home view
                }
            .opacity(isLoginMode ? (canLogin ? 1.0 : 0.8)
                                 : (canRegister ? 1.0 : 0.8))

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
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 6)
            Text("Solo Trip")
                .font(.system(size: 26, weight: .bold, design: .rounded))
        }
        .padding(.bottom, 30)

    }
}

#Preview {
    AuthView()
}
