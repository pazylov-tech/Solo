//
//  MainViewModel.swift
//  Solo
//

import Foundation
import Combine

class MainViewModel: ObservableObject {
    @Published var tasks: [Task] = Task.mockData
}
