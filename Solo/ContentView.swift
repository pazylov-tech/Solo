//
//  ContentView.swift
//  Solo
//
//  Created by Toichubek Pazylov on 2/9/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background color
                Color(red: 0.1, green: 0.2, blue: 0.5)
                    .ignoresSafeArea()
                
                VStack(spacing: 40) {
                    Text("Welcome!")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                    
                    // Navigate to NameInputView
                    NavigationLink(destination: NameInputView()) {
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
}

struct NameInputView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var navigateToConfirmation = false
    
    var body: some View {
        ZStack {
            Color(red: 0.1, green: 0.2, blue: 0.5)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Enter Your Name")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.bottom, 30)
                
                TextField("First Name", text: $firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)
                
                TextField("Last Name", text: $lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)
                
                // Confirm → navigate to ConfirmationView
                NavigationLink(
                    destination: ConfirmationView(firstName: firstName, lastName: lastName),
                    isActive: $navigateToConfirmation
                ) {
                    EmptyView()
                }
                
                Button("Confirm") {
                    navigateToConfirmation = true
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .foregroundColor(Color(red: 0.1, green: 0.2, blue: 0.5))
                .cornerRadius(12)
                .shadow(radius: 5)
                .padding(.horizontal, 40)
                
                Spacer()
            }
            .padding(.top, 100)
        }
    }
}

struct ConfirmationView: View {
    var firstName: String
    var lastName: String
    
    var body: some View {
        ZStack {
            Color(red: 0.1, green: 0.2, blue: 0.5)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text("Welcome, \(firstName) \(lastName)!")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .shadow(radius: 4)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
