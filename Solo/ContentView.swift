//
//  ContentView.swift
//  Solo
//
//  Created by Toichubek Pazylov on 2/9/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Background color
            Color(red: 0.1, green: 0.2, blue: 0.5)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text("Welcome!")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .shadow(radius: 4)
                
                Button(action: {
                    // TODO: Add navigation or action here
                    print("Proceed tapped")
                }) {
                    Text("Proceed")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .foregroundColor(Color(red: 0.1, green: 0.2, blue: 0.5))
                        .cornerRadius(12)
                        .shadow(radius: 5)
                }
                .padding(.horizontal, 37)
            }
        }
    }
}

#Preview {
    ContentView()
}
