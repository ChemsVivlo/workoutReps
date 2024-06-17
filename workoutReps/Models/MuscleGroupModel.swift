//
//  MuscleGroupModel.swift
//  workoutReps
//
//  Created by Jose Vivanco on 23/03/24.
//

import Foundation

struct MuscleGroupModel: Identifiable {
    
    private(set) var id: String
    private(set) var muscleGroupName: String
    private(set) var exercises: [ExerciseModel] = []
    
    init(id: String = UUID().uuidString, muscleGroupName: String, exercises: [ExerciseModel]) {
        self.id = id
        self.muscleGroupName = muscleGroupName
        self.exercises = exercises
    }
    
    mutating func updateMuscleGroupName(_ muscleGroupName: String) {
        self.muscleGroupName = muscleGroupName
    }
    
    mutating func addExcercise(_ exercise: ExerciseModel){
        self.exercises.append(exercise)
    }
    
    mutating func removeExcercise(at index: Int){
        self.exercises.remove(at: index)
    }
    
}
