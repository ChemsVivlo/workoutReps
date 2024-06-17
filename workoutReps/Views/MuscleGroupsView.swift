//
//  Exercises.swift
//  workoutReps
//
//  Created by Jose Vivanco on 23/03/24.
//

import SwiftUI

struct MuscleGroupsView: View {
    
    @EnvironmentObject var userModel: UserModel
    
    @State private var testMuscleGroups: [MuscleGroupModel] = []
    
    private let colors: [Color] = [
        .red,
        .green,
        .blue,
        .purple,
        .orange,
        .yellow
    ]
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170, maximum: 170))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: adaptiveColumns) {
                ForEach(Array(userModel.muscleGroups.enumerated()), id: \.element.id) { index, muscleGroup in 
                    NavigationLink(destination: ExercisesView(muscleGroup: muscleGroup)) {
                        let indexColor = (index+1) % colors.count
                        MuscleGroupCell(muscleGroupName: muscleGroup.muscleGroupName, color: colors[indexColor])
                    }
                }
            }
        }
        .navigationTitle("Muscle Groups")
        .navigationBarItems(
            trailing: NavigationLink("Add", destination: AddMuscleGroupView())
                .foregroundColor(.black)
                .font(.system(size: 20))
                .bold()
        )
    }
    
    private func deleteItem(at index: Int) {
        userModel.removeMuscleGroup(at: index)
    }
    
}

#Preview {
    NavigationView {
        MuscleGroupsView()
    }.environment(UserModel(userName: nil, age: nil, profileImageURLString: nil))
}
