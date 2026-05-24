//
//  MainView.swift
//  Solo
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        
        ZStack {
            VStack {
                ScrollView {
                    
                    VStack (alignment: .leading, spacing: 20) {
                        Text("WELCOME PLAYER")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .tracking(3)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text("Let’s get your\nSolo Journey started")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(.black)
                        
                        Text("Build habits, track progress, and become the main character of your own story.")
                            .font(.body)
                            .foregroundColor(.gray)
                            .padding(.top, 4)
                        
                        Spacer()
                    }
                    .padding(32)
                    
                    VStack {
                        ForEach(viewModel.tasks) { task in
                            Text(task.title)
                            Text(task.count)
                        }
                    }
                    
                }
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        MainView()
    }
}
