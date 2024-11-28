//
//  workouts.swift
//  Swift Workout
//
//  Created by aaron reyes on 11/27/24.
//
import Foundation


struct Exercise: Identifiable, Decodable, Hashable
{
    let name: String
    let force: String?
    let level: String?
    let mechanic: String?
    let equipment: String?
    let primaryMuscles: [String]?
    let instructions: [String]?
    let category: String?
    let images: [String]?
    let id: String
}


func loadJson<T:Decodable>(_ filename: String) -> T{
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("File \(filename) not found")
    }
    do {
        data = try Data(contentsOf:file)
    }catch{
        fatalError("File \(filename) not loaded")
    }
    do
    {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("Could not parse file: \(filename)")
    }
}

var exercises_upper: [Exercise] = loadJson("exercises_upper.json")
var exercises_lower: [Exercise] = loadJson("exercises_lower.json")

var upper: [String] = ["chest",
                  "biceps",
                  "triceps",
                  "forearms",
                  "shoulders",
                  "lats",
                  "middle back",
                  "lower back",
                  "traps",
                  "abdominals"]

var lower: [String] = ["quadriceps",
                  "hamstrings",
                  "glutes",
                  "abductors",
                  "adductors",
                  "calves"]


func muscles(_ name:String) -> [String]
{
    if name == "upper"{return upper}
    if name == "lower"{return lower}
    if name == "all"{return upper + lower}
    return []
}

func muscle_group(_ name:String) -> [Exercise]
{
    if name == "upper"{return exercises_upper}
    if name == "lower"{return exercises_lower}
    if name == "all"{return exercises_upper + exercises_lower}
    return []
}

func muscle_exercises(_ name:String) -> [Exercise]
{
    var all_exercises: [Exercise] = []
    if upper.contains(name){
        for element in exercises_upper
        {
            if element.primaryMuscles?.contains(name) != nil{
                all_exercises.append(element)
            }
        }
    }
    
    else if lower.contains(name){
        for element in exercises_lower
        {
            if element.primaryMuscles?.contains(name) != nil{
                all_exercises.append(element)
            }
        }
    }

    
    return all_exercises
    
}



