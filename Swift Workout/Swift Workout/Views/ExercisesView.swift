//
//  ExercisesView.swift
//  Swift Workout
//
//  Created by aaron reyes on 11/28/24.
//

import SwiftUI

struct ExercisesView: View {
    let muscle: String
    var body: some View {
        let exercise_list = muscle_exercises(muscle)
        NavigationView {
            ZStack (alignment: .top) {
                Color.black.edgesIgnoringSafeArea(.all)
                
                LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.8), Color.clear]),
                               startPoint: .top,
                               endPoint: .bottom)
                .frame(height: 500)
                .edgesIgnoringSafeArea(.all)
                ScrollView(.vertical){
                    LazyVStack {
                        Text("\(muscle.capitalized) Exercises")
                            .font(.largeTitle)
                            .padding()
                            .foregroundColor(.white)
                        
                        // Loop through muscle groups and create a NavigationLink for each
                        ForEach(exercise_list) { ex in
                            NavigationLink(destination: DetailView(exercise: ex)) {
                                Text(ex.name)
                                    .font(.title)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    ExercisesView(muscle: "chest")
}
