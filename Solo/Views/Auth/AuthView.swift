//
//  AuthView.swift
//  Solo
//

import SwiftUI

struct AuthView: View {
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
                .frame(width: 90, height: 90)
                .shadow(color: .white.opacity(0.08), radius: 10, x: 0, y: 6)
                .cornerRadius(15)
            
            Text("Auth Coming Soon")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .foregroundStyle(.black.opacity(0.9))
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 28)
    }
}

#Preview {
    AuthView()
}
