//
//  AllView.swift
//  Swift Workout
//
//  Created by aaron reyes on 11/28/24.
//

import SwiftUI
struct MuscleView: View {
    let musclegroup: String
    //let muscles = muscles(musclegroup)
    
    var body: some View {
        let muscles = muscles(musclegroup)
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
                        Text("Muscle Group")
                            .font(.largeTitle)
                            .padding()
                            .foregroundColor(.white)
                        
                        // Loop through muscle groups and create a NavigationLink for each
                        ForEach(muscles, id: \.self) { name in
                            NavigationLink(destination: ExercisesView(muscle: name)) {
                                Text(name.capitalized)
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
    MuscleView(musclegroup: "upper")
}
