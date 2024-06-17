//
//  workoutRepsApp.swift
//  workoutReps
//
//  Created by Jose Vivanco on 23/03/24.
//

import SwiftUI

@main
struct workoutRepsApp: App {
    
    @StateObject var userModel = UserModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MuscleGroupsView()
            }.environmentObject(userModel)
        }
    }
}
