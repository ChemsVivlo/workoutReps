//
//  UserModel.swift
//  workoutReps
//
//  Created by Jose Vivanco on 23/03/24.
//
import Foundation

class UserModel: Observable, ObservableObject {
    private(set) var userUUID: String
    @Published private(set) var muscleGroups: [MuscleGroupModel] = []
    
    init(userUUID: String = UUID().uuidString) {
        self.userUUID = userUUID
    }
    
    func addMuscleGroup(_ muscleGroup: MuscleGroupModel) {
        self.muscleGroups.append(muscleGroup)
    }
    
    func removeMuscleGroup(at index: Int) {
        self.muscleGroups.remove(at: index)
    }
    
}
