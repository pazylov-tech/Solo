//
//  MainButton.swift
//  Solo
//

import SwiftUI

struct MainButton: View {
    var title: String
    var icon: Image? = nil
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .frame(height: 52)
                .frame(maxWidth: .infinity)
                .background(.gray)
                .foregroundStyle(.black)
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .font(.system(size: 20, weight: .bold))
                .padding(.horizontal, 16)
        }
    }
}
