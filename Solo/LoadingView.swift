//
//  LoadingView.swift
//  Solo
//
//  Created by Pazylov Toichubek on 10/11/26.
//

import SwiftUI

struct LoadingView: View {
    @State private var showText = false
    
    var body: some View {
        ZStack {
            
            EllipticalGradient(
                stops: [
                    .init(color: Color(red: 0.04, green: 0.10, blue: 0.23), location: 0),
                    .init(color: Color(red: 0.02, green: 0.04, blue: 0.08), location: 0.55),
                    .init(color: Color(red: 0.00, green: 0.01, blue: 0.04), location: 1)
                ],
                center: UnitPoint(x: 0.5, y: 0.42),
                endRadiusFraction: 1.4
            )
            
            Circle()
                .fill(Color(red: 0.11, green: 0.37, blue: 1.0))
                .frame(width: 260, height: 260)
                .blur(radius: 60)
                .opacity(0.45)
                .offset(x: -140, y: -120)
            
            Circle()
                .fill(Color(red: 0.0, green: 0.34, blue: 1.0))
                .frame(width: 220, height: 220)
                .blur(radius: 70)
                .opacity(0.45)
                .offset(x: 150, y: 150)
            
            Text("SOLO · SYSTEM")
                .font(.custom("Rajdhani-SemiBold", size: 17))
                .tracking(8.5)
                .foregroundStyle(Color(red: 0.56, green: 0.70, blue: 0.85))
                .opacity(showText ? 1 : 0)
                .blur(radius: showText ? 0 : 6)
            
        }
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.easeOut(duration: 1.0)) { showText = true }
        }
        
    }
}

#Preview {
    LoadingView()
}
