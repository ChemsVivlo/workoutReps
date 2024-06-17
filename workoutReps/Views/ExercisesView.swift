//
//  ExercisesView.swift
//  workoutReps
//
//  Created by Jose Vivanco on 25/03/24.
//

import SwiftUI

struct ExercisesView: View {
    
    @EnvironmentObject var userModel: UserModel
    @State var muscleGroup: MuscleGroupModel 
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170, maximum: 170))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: adaptiveColumns) {
                Text("List of exercises")
                    .font(.headline)
                    .foregroundStyle(Color.accentColor)
            }
            .padding(.vertical, 20)
        }
        .navigationTitle(muscleGroup.muscleGroupName)
        .navigationBarItems(trailing: NavigationLink("Add", destination: Text("Exercise"))
            .font(.system(size: 20))
        )
    }
}

#Preview {
    NavigationView {
        ExercisesView(muscleGroup: MuscleGroupModel(muscleGroupName: "Chest", exercises: []))
    }
}
