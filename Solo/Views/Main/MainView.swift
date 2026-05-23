//
//  MainView.swift
//  Solo
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Spacer()
            Text("WELCOME PLAYER")
                .font(.caption)
                .fontWeight(.semibold)
                .tracking(3)
                .foregroundColor(.gray)

            Text("Let’s get your\nSolo Journey started")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.black)

            Text("Build habits, track progress, and become the main character of your own story.")
                .font(.body)
                .foregroundColor(.gray)
                .padding(.top, 4)

            Spacer()
        }
        .padding(32)
        
    }
}

#Preview {
    MainView()
}
