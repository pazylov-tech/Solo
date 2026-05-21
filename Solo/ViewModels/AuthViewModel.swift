//
//  AuthViewModel.swift
//  Solo
//

import Foundation
import Combine

class AuthViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var age: String = ""
    @Published var gender: String = ""
    @Published var phoneNumber: String = ""
}
