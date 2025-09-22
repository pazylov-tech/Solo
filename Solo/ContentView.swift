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

// Step 1: Name Input
struct NameInputView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var navigateToEmail = false
    
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
                
                // Navigate to EmailInputView
                NavigationLink(
                    destination: EmailInputView(firstName: firstName, lastName: lastName),
                    isActive: $navigateToEmail
                ) {
                    EmptyView()
                }
                
                Button("Next") {
                    navigateToEmail = true
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

// Step 2: Email Input
struct EmailInputView: View {
    var firstName: String
    var lastName: String
    
    @State private var email = ""
    @State private var navigateToDOB = false
    
    var body: some View {
        ZStack {
            Color(red: 0.1, green: 0.2, blue: 0.5)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Enter Your Email")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.bottom, 30)
                
                TextField("Email Address", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                // Navigate to DOBInputView
                NavigationLink(
                    destination: DOBInputView(firstName: firstName, lastName: lastName, email: email),
                    isActive: $navigateToDOB
                ) {
                    EmptyView()
                }
                
                Button("Next") {
                    navigateToDOB = true
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

// Step 3: DOB Input
struct DOBInputView: View {
    var firstName: String
    var lastName: String
    var email: String
    
    @State private var dateOfBirth = Date()
    @State private var navigateToConfirmation = false
    
    var body: some View {
        ZStack {
            Color(red: 0.1, green: 0.2, blue: 0.5)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Enter Your Date of Birth")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.bottom, 30)
                
                DatePicker("Date of Birth", selection: $dateOfBirth, displayedComponents: .date)
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                    .padding(.horizontal, 40)
                
                // Navigate to ConfirmationView
                NavigationLink(
                    destination: ConfirmationView(
                        firstName: firstName,
                        lastName: lastName,
                        email: email,
                        dateOfBirth: dateOfBirth
                    ),
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

// Final Registration Screen
struct ConfirmationView: View {
    var firstName: String
    var lastName: String
    var email: String
    var dateOfBirth: Date
    
    var body: some View {
        ZStack {
            Color(red: 0.1, green: 0.2, blue: 0.5)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Welcome, \(firstName) \(lastName)!")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .shadow(radius: 4)
                
                Text("Email: \(email)")
                    .foregroundColor(.white)
                    .font(.headline)
                
                Text("Date of Birth: \(dateOfBirth.formatted(date: .long, time: .omitted))")
                    .foregroundColor(.white)
                    .font(.headline)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
