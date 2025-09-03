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
            Color.init(red: 0.1, green: 0.2, blue: 0.5).ignoresSafeArea()  // fill the whole screen
            
            VStack {
                Text("SOLO")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer() // pushes the text to the top
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
