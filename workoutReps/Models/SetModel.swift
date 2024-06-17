//
//  SetModel.swift
//  workoutReps
//
//  Created by Jose Vivanco on 23/03/24.
//

import Foundation

struct SetModel: Identifiable {
    let id: String = UUID().uuidString
    private(set) var weight: Int
    private (set) var repetitions: Int
    private(set) var weightUnits: WeightUnits
    
    mutating func updateWeight(_ weight: Int) {
        self.weight = weight
    }
    
    mutating func updateRepetitions(_ repetitions: Int) {
        self.repetitions = repetitions
    }
    
    mutating func updateWeightUnits(_ weightUnits: WeightUnits) {
        self.weightUnits = weightUnits
    }
}
