//
//  Task.swift
//  Solo
//

import Foundation

struct Task: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var count: String
}

extension Task {
    static var mockData: [Task] = [
        Task(title: "Push-ups", count: "[0/100]"),
        Task(title: "Sit-ups", count: "[0/100]"),
        Task(title: "Squats", count: "[0/100]"),
        Task(title: "Running", count: "[0/10km]")
    ]
}
