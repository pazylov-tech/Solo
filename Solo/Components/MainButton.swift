//
//  MainButton.swift
//  Solo
//

import SwiftUI

struct MainButton: View {
    var title: String
    var icon: Image? = nil
    var action: () -> Void
    
    let midnightBlue = Color(
        red: 10/255,
        green: 25/255,
        blue: 47/255
    )
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .frame(height: 52)
                .frame(maxWidth: .infinity)
                .background(midnightBlue)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .font(.system(size: 20, weight: .bold))
                .padding(.horizontal, 16)
        }
    }
}
