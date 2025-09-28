//
//  ContentView.swift
//  Solo
//
//  Created by Toichubek Pazylov on 2/9/25.
//

import SwiftUI

// MARK: - Helpers
fileprivate func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "(?:[A-Z0-9a-z._%+-]+)@(?:[A-Za-z0-9.-]+)\\.[A-Za-z]{2,64}"
    return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
}

fileprivate func age(from dob: Date) -> Int {
    Calendar.current.dateComponents([.year], from: dob, to: Date()).year ?? 0
}

let themeColor = Color(red: 0.1, green: 0.2, blue: 0.5)
let accentWhite = Color.white

// MARK: - Root
struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                themeColor.ignoresSafeArea()
                
                VStack(spacing: 40) {
                    Spacer()
                    
                    Text("Welcome!")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundColor(accentWhite)
                        .shadow(radius: 4)
                    
                    NavigationLink(destination: NameInputView()) {
                        Text("Proceed")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(accentWhite)
                            .foregroundColor(themeColor)
                            .cornerRadius(12)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal, 37)
                    
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

// MARK: - Name Input
struct NameInputView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var navigateToEmail = false
    @FocusState private var focusedField: NameField?
    
    enum NameField { case first, last }
    
    private var isNameValid: Bool {
        !firstName.trimmingCharacters(in: .whitespaces).isEmpty &&
        !lastName.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    var body: some View {
        ZStack {
            themeColor.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Enter Your Name")
                    .font(.title)
                    .foregroundColor(accentWhite)
                    .padding(.bottom, 10)
                
                Group {
                    TextField("First Name", text: $firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .focused($focusedField, equals: .first)
                        .submitLabel(.next)
                        .onSubmit { focusedField = .last }
                    
                    TextField("Last Name", text: $lastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .focused($focusedField, equals: .last)
                        .submitLabel(.done)
                        .onSubmit { focusedField = nil }
                }
                .padding(.horizontal, 40)
                
                // Navigate to EmailInputView
                NavigationLink(
                    destination: EmailInputView(firstName: firstName, lastName: lastName),
                    isActive: $navigateToEmail
                ) { EmptyView() }
                
                Button(action: { navigateToEmail = true }) {
                    Text("Next")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isNameValid ? accentWhite : .gray.opacity(0.6))
                        .foregroundColor(themeColor)
                        .cornerRadius(12)
                        .shadow(radius: isNameValid ? 5 : 0)
                }
                .disabled(!isNameValid)
                .padding(.horizontal, 40)
                
                Spacer()
            }
            .padding(.top, 40)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") { focusedField = nil }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Email Input
struct EmailInputView: View {
    var firstName: String
    var lastName: String
    
    @State private var email = ""
    @State private var navigateToDOB = false
    @FocusState private var emailFocused: Bool
    
    private var isEmailValid: Bool {
        isValidEmail(email)
    }
    
    var body: some View {
        ZStack {
            themeColor.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Enter Your Email")
                    .font(.title)
                    .foregroundColor(accentWhite)
                    .padding(.bottom, 10)
                
                TextField("Email Address", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .focused($emailFocused)
                    .submitLabel(.done)
                    .onSubmit { emailFocused = false }
                
                if !email.isEmpty {
                    HStack {
                        Image(systemName: isEmailValid ? "checkmark.seal.fill" : "xmark.octagon.fill")
                            .foregroundColor(isEmailValid ? .green : .yellow)
                        Text(isEmailValid ? "Valid email" : "Invalid email")
                            .foregroundColor(.white)
                            .font(.footnote)
                    }
                }
                
                NavigationLink(
                    destination: DOBInputView(firstName: firstName, lastName: lastName, email: email),
                    isActive: $navigateToDOB
                ) { EmptyView() }
                
                Button(action: { navigateToDOB = true }) {
                    Text("Next")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isEmailValid ? accentWhite : .gray.opacity(0.6))
                        .foregroundColor(themeColor)
                        .cornerRadius(12)
                        .shadow(radius: isEmailValid ? 5 : 0)
                }
                .disabled(!isEmailValid)
                .padding(.horizontal, 40)
                
                Spacer()
            }
            .padding(.top, 40)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") { emailFocused = false }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - DOB Input
struct DOBInputView: View {
    var firstName: String
    var lastName: String
    var email: String
    
    @State private var dateOfBirth = Date()
    @State private var navigateToConfirmation = false
    
    private var userAge: Int { age(from: dateOfBirth) }
    private var isDOBValid: Bool { userAge >= 13 } // example minimum
    
    var body: some View {
        ZStack {
            themeColor.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Enter Your Date of Birth")
                    .font(.title)
                    .foregroundColor(accentWhite)
                    .padding(.bottom, 10)
                
                DatePicker("", selection: $dateOfBirth, displayedComponents: .date)
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                    .padding(.horizontal, 40)
                    .frame(maxHeight: 200)
                
                Text("Age: \(userAge)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                
                NavigationLink(
                    destination: ConfirmationView(firstName: firstName, lastName: lastName, email: email, dateOfBirth: dateOfBirth),
                    isActive: $navigateToConfirmation
                ) { EmptyView() }
                
                Button(action: { navigateToConfirmation = true }) {
                    Text("Confirm")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isDOBValid ? accentWhite : .gray.opacity(0.6))
                        .foregroundColor(themeColor)
                        .cornerRadius(12)
                        .shadow(radius: isDOBValid ? 5 : 0)
                }
                .disabled(!isDOBValid)
                .padding(.horizontal, 40)
                
                if !isDOBValid {
                    Text("You must be 13 or older.")
                        .foregroundColor(.yellow)
                        .font(.footnote)
                        .padding(.top, 6)
                }
                
                Spacer()
            }
            .padding(.top, 20)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Confirmation
struct ConfirmationView: View {
    var firstName: String
    var lastName: String
    var email: String
    var dateOfBirth: Date
    
    var body: some View {
        ZStack {
            themeColor.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Welcome, \(firstName) \(lastName)!")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .shadow(radius: 4)
                
                VStack(spacing: 6) {
                    Text("Email: \(email)")
                    Text("Date of Birth: \(dateOfBirth.formatted(date: .long, time: .omitted))")
                }
                .foregroundColor(.white)
                .font(.headline)
                
                Spacer()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Previews
#Preview {
    ContentView()
}
