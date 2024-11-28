//
//  ExersizeDetailView.swift
//  Swift Workout
//
//  Created by aaron reyes on 11/28/24.
//

import SwiftUI

struct DetailView: View {
    let exercise: Exercise
    var body: some View {
        NavigationView {
            ZStack (alignment: .top) {
                Color.black.edgesIgnoringSafeArea(.all)
                
                LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.8), Color.clear]),
                               startPoint: .top,
                               endPoint: .bottom)
                .frame(height: 500)
                .edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack {
                        Text(exercise.name)
                            .font(.largeTitle)
                            .padding()
                            .foregroundColor(.white)
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    if let exer: Exercise = muscle_exercises("chest").first
    {DetailView(exercise: exer)}
}
