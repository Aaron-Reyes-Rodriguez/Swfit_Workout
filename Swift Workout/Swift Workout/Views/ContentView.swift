//
//  ContentView.swift
//  Swift Workout
//
//  Created by aaron reyes on 10/22/24.
//

import SwiftUI

struct ContentView: View {
    
    let types = ["upper", "lower", "all"]
    
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
                        Text("Muscle Group")
                            .font(.largeTitle)
                            .padding()
                            .foregroundColor(.white)
                        
                        // Loop through muscle groups and create a NavigationLink for each
                        ForEach(types, id: \.self) { name in
                            NavigationLink(destination: MuscleView(musclegroup: name)) {
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
    ContentView()
}


