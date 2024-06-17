//
//  AddView.swift
//  workoutReps
//
//  Created by Jose Vivanco on 24/03/24.
//

import SwiftUI

struct AddMuscleGroupView: View {
    
    @EnvironmentObject var userModel: UserModel
    @Environment(\.presentationMode) var presentationMode
    
    @State var textFieldText: String = ""
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""  
    @Binding var isEditing: Bool
    var muscleGroupIndex: Int?
    @Binding var indexTapped: Int?
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Muscle group...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
        }
        .navigationTitle(isEditing ? "Edit" : "Add a Muscle Group 💪🏻")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .alert(isPresented: $showAlert, content: getAlert)
        .padding(14)
    }
    
    private var backButton: some View {
        Button(action: {
            isEditing = false
            indexTapped = nil
            presentationMode.wrappedValue.dismiss()
        }) {
            Text("Back")
                .foregroundColor(.accentColor)
                .font(.system(size: 20))
        }
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            if isEditing {
                if let index = muscleGroupIndex {
                    userModel.updateMuscleGroupName(at: index, newName: textFieldText)
                    isEditing = false
                    indexTapped = nil
                }
            } else {
                let newMuscleGroup = MuscleGroupModel(muscleGroupName: textFieldText, exercises: [])
                userModel.addMuscleGroup(newMuscleGroup)
            }
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new item must be at least 3 characters long 😱😱"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

#Preview {
    NavigationView {
        AddMuscleGroupView(isEditing: .constant(true), indexTapped: .constant(0))
    }.environment(UserModel())
}
