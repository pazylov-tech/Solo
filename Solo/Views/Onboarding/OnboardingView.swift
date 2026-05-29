//
//  OnboardingView.swift
//  Solo
//

import SwiftUI

struct OnboardingPage {
    let symbol: String
    let symbolColor: Color
    let bgColor: Color
    let title: String
    let subtitle: String
}

private let pages: [OnboardingPage] = [
    OnboardingPage(
        symbol: "cap",
        symbolColor: .blue,
        bgColor: Color.blue.opacity(0.05),
        title: "Welcome to Solo Trip",
        subtitle: "Build your habits, start simple, track your progress and reach momentum."
    )
]


struct OnboardingView: View {
    @State private var currentPage = 0
    @State private var iconScale: CGFloat = 0.5
    @State private var iconOpacity: Double = 0
    @State private var isFloating = false
    
    var body: some View {
        ZStack {
            pages[currentPage].bgColor
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.4), value: currentPage)
            VStack {
                
                //Skip button
                HStack {
                    Spacer()
                    Button("Skip") {
                        //
                    }
                    .font(.subheadline).fontWeight(.medium)
                    .foregroundColor(.gray)
                    .padding(.top, 24)
                    .padding(.horizontal, 24)
                }
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    OnboardingView()
}
