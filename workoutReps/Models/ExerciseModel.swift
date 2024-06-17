//
//  ExerciseModel.swift
//  workoutReps
//
//  Created by Jose Vivanco on 23/03/24.
//

import Foundation

struct ExerciseModel {
    private(set) var exerciseName: String
    private(set) var imageURLString: String
    private(set) var numberOfSets: Int
    private(set) var sets: [SetModel] = []
    
    mutating func updateExerciseName(_ exerciseName: String) {
        self.exerciseName = exerciseName
    }
    
    mutating func updateimageURLString(_ imageURLString: String) {
        self.imageURLString = imageURLString
    }
    
    mutating func updatenumberOfSets(_ numberOfSets: Int) {
        self.numberOfSets = numberOfSets
    }
    
    mutating func addSet(_ set: SetModel) {
        sets.append(set)
    }
}
