//
//  AppField.swift
//  Solo
//

import SwiftUI

struct AppField: View {
    var icon: String? = nil
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack (spacing: 10) {
            
            if let icon = icon {
                Image(systemName: icon)
                    .foregroundColor(.gray)
                    .frame(width: 22)
            }
            
            TextField(placeholder, text: $text)
        }
        .frame(height: 48)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.gray.opacity(0.2))
        )
        .padding(.horizontal, 16)
    }
}
