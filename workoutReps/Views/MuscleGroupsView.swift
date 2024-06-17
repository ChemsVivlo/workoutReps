//
//  Exercises.swift
//  workoutReps
//
//  Created by Jose Vivanco on 23/03/24.
//

import SwiftUI

struct MuscleGroupsView: View {
    
    @EnvironmentObject var userModel: UserModel
    @StateObject var muscleGroupsVM = MuscleGroupsVM()
     
    @State private var isEditing = false
    @State private var indexTapped: Int?
    @State private var isLongPressing: Bool = false
    
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
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor(Color.accentColor)
        ]
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor(Color.accentColor)
        ]
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: adaptiveColumns) {
                ForEach(Array(userModel.muscleGroups.enumerated()), id: \.element.id) { index, muscleGroup in
                    
                    let indexColor = (index+1) % colors.count
                    
                    if isEditing {
                        isEditingCell(muscleGroupName: muscleGroup.muscleGroupName, index: index, isEditing: $isEditing, indexTapped: $indexTapped, color: colors[indexColor], isLongPressing: $isLongPressing)
                    } else {
                        //Missing to create function
                        Button {
                        } label: {
                            NavigationLink(destination: ExercisesView(muscleGroup: muscleGroup)) {
                                MuscleGroupCell(muscleGroupName: muscleGroup.muscleGroupName, color: colors[indexColor], localIndex: index, isEditing: $isEditing, indexTapped: $indexTapped, isLongPressing: $isLongPressing)
                            }
                            .disabled(isLongPressing)
                        }
                        .simultaneousGesture(LongPressGesture(minimumDuration: 0.3)
                            .onEnded({ longPress in
                                isLongPressing.toggle()
                            })
                        )
                    }
                }
            }
        }
        .navigationBarItems(
            leading: Button(action: {
                if !userModel.muscleGroups.isEmpty {
                    isEditing.toggle() // Toggle the value of isEditing
                }
                indexTapped = nil
            }) {
                Text("Edit")
                    .fontWeight(isEditing ? .bold : .regular)
            }
            ,
            trailing: NavigationLink("Add", destination: AddMuscleGroupView(isEditing: $isEditing, muscleGroupIndex: nil, indexTapped: $indexTapped))
                .simultaneousGesture(TapGesture().onEnded {
                    isEditing = false
                })
        )
        .foregroundColor(.accentColor)
        .font(.system(size: 20))
        .navigationTitle("Muscle Groups")
    }
    
    private func deleteItem(at index: Int) {
        userModel.removeMuscleGroup(at: index)
    }
    
}

// MARK: Cells

extension MuscleGroupsView {

    @ViewBuilder
    func isEditingCell(
                muscleGroupName: String,
                index: Int,
                isEditing: Binding<Bool>,//Binding
                indexTapped: Binding<Int?>,//Binding
                color: Color,
                isLongPressing: Binding<Bool> //Binding
    ) -> some View {
        Button {
        } label: {
            NavigationLink(destination: AddMuscleGroupView(textFieldText: muscleGroupName, isEditing: $isEditing, muscleGroupIndex: index, indexTapped: $indexTapped)) {
                MuscleGroupCell(muscleGroupName: muscleGroupName, color: color, localIndex: index, isEditing: $isEditing, indexTapped: $indexTapped, isLongPressing: $isLongPressing)
            }
            .disabled(isLongPressing.wrappedValue)
        }
        .simultaneousGesture(LongPressGesture(minimumDuration: 0.3)
            .onEnded({ longPress in
                isLongPressing.wrappedValue.toggle()
                print("Edit Simultaneous Long Pressing. isLongPressing = \(isLongPressing.wrappedValue)")
            })
        )
        .simultaneousGesture(TapGesture().onEnded{
            indexTapped.wrappedValue = index
        })
    }

}


#Preview {
    NavigationView {
        MuscleGroupsView()
    }.environment(UserModel())
}
