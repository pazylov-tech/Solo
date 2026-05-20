//
//  AuthView.swift
//  Solo
//

import SwiftUI

struct AuthView: View {
    @StateObject var viewModel = AuthViewModel()
    var body: some View {
        header
    }
}

extension AuthView {
    var header: some View {
        VStack (spacing: 16) {
            Image("solo-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .shadow(color: .white.opacity(0.08), radius: 10, x: 0, y: 6)
                .cornerRadius(15)
                .padding()
            Text("Welcome to the Solo Trip")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .foregroundStyle(.black.opacity(0.9))
                
            Spacer()
            
            VStack (alignment: .leading, spacing: 10){
                AppField(placeholder: "Name", text: $viewModel.name)
                AppField(placeholder: "Email", text: $viewModel.email)
                AppField(placeholder: "Password", text: $viewModel.password)
            }
            .padding(.horizontal, 16)
            
            VStack (spacing: 20){
                MainButton(title: "START") {
                    //
                }
            }
            Spacer()
        }

    }
}

#Preview {
    AuthView()
}
