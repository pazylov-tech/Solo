//
//  AppField.swift
//  Solo
//

import SwiftUI

struct AppField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .frame(height: 48)
            .padding(.horizontal, 16)
            .background(Color.gray.opacity(0.2))
    }
}
