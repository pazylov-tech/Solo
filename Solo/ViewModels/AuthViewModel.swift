//
//  AuthViewModel.swift
//  Solo
//

import Foundation
import Combine

class AuthViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
}

